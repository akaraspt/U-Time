"""
Script which predicts on a set of data and saves the results to disk.
Comparable to bin/evaluate.py except ground truth data is not needed as
evaluation is not performed.
Can also be used to predict on (a) individual file(s) outside of the datasets
originally described in the hyperparameter files.
"""

import os
import readline
import numpy as np
from argparse import ArgumentParser
from utime.bin.evaluate import (set_gpu_vis, predict_on, get_logger,
                                prepare_output_dir, get_and_load_model,
                                get_and_load_one_shot_model, get_sequencer,
                                get_out_dir)
from utime import defaults

readline.parse_and_bind('tab: complete')


def get_argparser():
    """
    Returns an argument parser for this script
    """
    parser = ArgumentParser(description='Predict using a U-Time model.')
    parser.add_argument("--folder_regex", type=str, required=False,
                        help='Regex pattern matching files to predict on. '
                             'If not specified, prediction will be launched '
                             'on the test_data as specified in the '
                             'hyperparameter file.')
    parser.add_argument("--project_dir", type=str, default="./",
                        help='Path to U-Time project folder')
    parser.add_argument("--data_per_prediction", type=int, default=None,
                        help='Number of samples that should make up each sleep'
                             ' stage scoring. Defaults to sample_rate*30, '
                             'giving 1 segmentation per 30 seconds of signal. '
                             'Set this to 1 to score every data point in the '
                             'signal.')
    parser.add_argument("--channels", nargs='*', type=str, default=None,
                        help="A list of channels to use instead of those "
                             "specified in the parameter file.")
    parser.add_argument("--data_split", type=str, default="test_data",
                        help="Which split of data of those stored in the "
                             "hparams file should the evaluation be performed "
                             "on. Ignored when --folder_regex is set.")
    parser.add_argument("--out_dir", type=str, default="predictions",
                        help="Output folder to store results")
    parser.add_argument("--num_GPUs", type=int, default=1,
                        help="Number of GPUs to use for this job")
    parser.add_argument("--strip_func", type=str, default=None,
                        help="Use a different strip function from the one "
                             "specified in the hyperparameters file")
    parser.add_argument("--num_test_time_augment", type=int, default=0,
                        help="Number of prediction passes over each sleep "
                             "study with augmentation enabled.")
    parser.add_argument("--one_shot", action="store_true",
                        help="Segment each SleepStudyBase in one forward-pass "
                             "instead of using (GPU memory-efficient) sliding "
                             "window predictions.")
    parser.add_argument("--save_true", action="store_true",
                        help="Save the true labels matching the predictions "
                             "(will be repeated if --data_per_prediction is "
                             "set to a non-default value)")
    parser.add_argument("--overwrite", action='store_true',
                        help='Overwrite previous results at the output folder')
    parser.add_argument("--force_GPU", type=str, default="")
    parser.add_argument("--no_argmax", action="store_true",
                        help="Do not argmax prediction volume prior to save.")
    parser.add_argument("--weights_file_name", type=str, required=False,
                        help="Specify the exact name of the weights file "
                             "(located in <project_dir>/model/) to use.")
    return parser


def assert_args(args):
    """ Not yet implemented """
    return


def set_new_strip_func(dataset_hparams, strip_func):
    if 'strip_func' not in dataset_hparams:
        dataset_hparams['strip_func'] = {}
    dataset_hparams['strip_func'] = {'strip_func': strip_func}


def get_prediction_channel_sets(sleep_study, dataset):
    """
    TODO

    Args:
        sleep_study:
        dataset:

    Returns:

    """
    # If channel_groups are set in dataset.misc, run on all pairs of channels
    channel_groups = dataset.misc.get('channel_groups')
    if channel_groups and hasattr(sleep_study, 'psg_file_path'):
        from utime.io.channels import filter_non_available_channels
        channel_groups = filter_non_available_channels(
            channel_groups=channel_groups,
            psg_file_path=sleep_study.psg_file_path
        )
        channel_groups = [c.original_names for c in channel_groups]
        # Return all combinations
        from itertools import product
        combinations = product(*channel_groups)
        return [
            ("+".join(c), c) for c in combinations
        ]
    elif channel_groups:
        raise NotImplementedError("Cannot perform channel group predictions "
                                  "on sleep study objects that have no "
                                  "psg_file_path attribute. "
                                  "Not yet implemented.")
    else:
        return [None, None]


def get_datasets(hparams, args, logger):
    from utime.utils.scriptutils import (get_dataset_from_regex_pattern,
                                         get_dataset_splits_from_hparams,
                                         get_all_dataset_hparams)
    # Get dictonary of dataset IDs to hparams
    all_dataset_hparams = get_all_dataset_hparams(hparams)

    # Make modifications to the hparams before dataset init if needed
    for dataset_id, dataset_hparams in all_dataset_hparams.items():
        if args.strip_func:
            # Replace the set strip function
            set_new_strip_func(dataset_hparams, args.strip_func)
        # Check if load-time channel selector is set
        channel_groups = dataset_hparams.get('load_time_channel_sampling_groups')
        if channel_groups:
            # Add the channel groups to a separate field, handled at pred. time
            # Make sure all available channels are available in the misc attr.
            del dataset_hparams['load_time_channel_sampling_groups']
            dataset_hparams['misc'] = {'channel_groups': channel_groups}

    if args.folder_regex:
        # We predict on a single dataset, specified by the folder_regex arg
        # We load the dataset hyperparameters of one of those specified in
        # the stored hyperparameter files and use it as a guide for how to
        # handle this new, undescribed dataset
        dataset_hparams = list(all_dataset_hparams.values())[0]
        datasets = [(get_dataset_from_regex_pattern(args.folder_regex,
                                                    hparams=dataset_hparams,
                                                    logger=logger),)]
    else:
        # predict on datasets described in the hyperparameter files
        datasets = []
        for dataset_id, dataset_hparams in all_dataset_hparams.items():
            datasets.append(get_dataset_splits_from_hparams(
                hparams=dataset_hparams,
                splits_to_load=(args.data_split,),
                logger=logger,
                id=dataset_id
            ))
    return datasets


def predict_study(sleep_study_pair, seq, model, model_func, logger, args):
    # Predict
    with logger.disabled_in_context(), sleep_study_pair.loaded_in_context():
        y, pred = predict_on(study_pair=sleep_study_pair,
                             seq=seq,
                             model=model,
                             model_func=model_func,
                             n_aug=args.num_test_time_augment,
                             argmax=False)
    org_pred_shape = pred.shape
    pred, y = pred.numpy().reshape(-1, 5), y.reshape(-1, 1)
    if not args.no_argmax:
        pred = pred.argmax(-1)
    return pred, y, org_pred_shape


def run_pred(dataset,
             out_dir,
             model,
             model_func,
             hparams,
             args,
             logger):
    """
    Run prediction on a all entries of a SleepStudyDataset

    Args:
        dataset:     A SleepStudyDataset object storing one or more SleepStudyBase
                     objects
        out_dir:     Path to directory that will store predictions and
                     evaluation results
        model:       An initialized model used for prediction
        model_func:  A callable that returns an initialized model for pred.
        hparams:     An YAMLHparams object storing all hyperparameters
        args:        Passed command-line arguments
        logger:      A Logger object
    """
    logger("\nPREDICTING ON {} STUDIES".format(len(dataset.pairs)))
    seq = get_sequencer(dataset, hparams)

    # Predict on all samples
    for i, sleep_study_pair in enumerate(dataset):
        logger("[{}/{}] Predicting on SleepStudyBase: {}".format(i+1,
                                                             len(dataset),
                                                             sleep_study_pair.identifier))

        # Get list of channel sets to predict on
        channel_sets = get_prediction_channel_sets(sleep_study_pair, dataset)
        if len(channel_sets) > 10:
            logger.warn("Many ({}) combinations of channels in channel "
                        "groups!".format(len(channel_sets)))
        if len(channel_sets) == 0:
            logger.warn("Found no valid channel sets...")

        for i, (sub_folder_name, channels_to_load) in enumerate(channel_sets):
            # Load and predict on the set channels
            if channels_to_load:
                logger(" -- Channels: {}".format(channels_to_load))
                sleep_study_pair.select_channels = channels_to_load
            pred, y, org_pred_shape = predict_study(
                sleep_study_pair, seq, model, model_func, logger, args
            )
            if args.save_true and i == 0:
                # Save true to disk, only save once if multiple channel sets
                # Note that we save the true values to the folder storing
                # results for each channel if multiple channel sets
                out_path = os.path.join(out_dir, sleep_study_pair.identifier + "_TRUE.npy")
                if len(org_pred_shape) == 3:
                    y = np.repeat(y, org_pred_shape[1])
                logger("* Saving true array of shape {} to {}".format(
                    y.shape, out_path
                ))
                np.save(out_path, y)

            if sub_folder_name is not None:
                out_dir_pred = os.path.join(out_dir, sub_folder_name)
                os.makedirs(out_dir_pred, exist_ok=True)
            else:
                out_dir_pred = out_dir

            # Save pred to disk
            out_path = os.path.join(out_dir_pred,
                                    sleep_study_pair.identifier + "_PRED.npy")
            logger("* Saving prediction array of shape {} to {}".format(
                pred.shape, out_path
            ))
            np.save(out_path, pred)


def run(args):
    """
    Run the script according to args - Please refer to the argparser.
    """
    assert_args(args)
    # Check project folder is valid
    from utime.utils.scriptutils import assert_project_folder
    project_dir = os.path.abspath(args.project_dir)
    assert_project_folder(project_dir, evaluation=True)

    # Prepare output dir
    if not args.folder_regex:
        out_dir = get_out_dir(args.out_dir, args.data_split)
    else:
        out_dir = args.out_dir
    prepare_output_dir(out_dir, args.overwrite)
    logger = get_logger(out_dir, args.overwrite, name="prediction_log")
    logger("Args dump: \n{}".format(vars(args)))

    # Get hyperparameters and init all described datasets
    from utime.hyperparameters import YAMLHParams
    hparams = YAMLHParams(defaults.get_hparams_path(project_dir), logger)
    hparams["build"]["data_per_prediction"] = args.data_per_prediction
    if args.channels:
        hparams["select_channels"] = args.channels
        hparams["channel_sampling_groups"] = None
        logger("Evaluating using channels {}".format(args.channels))

    # Get model
    set_gpu_vis(args.num_GPUs, args.force_GPU, logger)
    model, model_func = None, None
    if args.one_shot:
        # Model is initialized for each sleep study later
        def model_func(n_periods):
            return get_and_load_one_shot_model(n_periods, project_dir,
                                               hparams, logger,
                                               args.weights_file_name)
    else:
        model = get_and_load_model(project_dir, hparams, logger,
                                   args.weights_file_name)

    # Get all datasets to predict on
    for dataset in get_datasets(hparams, args, logger):
        dataset = dataset[0]
        if "/" in dataset.identifier:
            # Multiple datasets, separate results into sub-folders
            ds_out_dir = os.path.join(out_dir,
                                      dataset.identifier.split("/")[0])
            if not os.path.exists(ds_out_dir):
                os.mkdir(ds_out_dir)
        else:
            ds_out_dir = out_dir
        logger("[*] Running eval on dataset {}\n"
               "    Out dir: {}".format(dataset, ds_out_dir))
        run_pred(dataset=dataset,
                 out_dir=ds_out_dir,
                 model=model,
                 model_func=model_func,
                 hparams=hparams,
                 args=args,
                 logger=logger)


def entry_func(args=None):
    # Parse command line arguments
    parser = get_argparser()
    run(parser.parse_args(args))


if __name__ == "__main__":
    entry_func()

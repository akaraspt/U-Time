```
# Extract data and label - use isruc_convert.ipynb

# Split
ut cv_split --data_dir './processed/isruc_sg1/' --subject_dir_pattern 'subject*PSG' --CV 1 --validation_fraction 0.10 --max_validation_subjects 100 --test_fraction 0.10 --max_test_subjects 100 --overwrite

# Initialize a U-Time project
ut init --name isruc_sg1_project \
        --model utime \
        --data_dir processed/isruc_sg1/views/fixed_split \
        --overwrite

# Train
cd isruc_sg1_project
ut train --num_gpus=2 --overwrite
# Required modification on `isruc_sg1_project/hyperparameters/dataset_configuration/dataset_1.yaml`
#  - Change the "select_channels" and "alternative_select_channels" specify the channels (e.g., [F4-LER] and [F4-CLE])
#  - Add "psg_regex: .*[.]h5" and "hyp_regex: .*[.]ids" in dataset_1.yaml
#  - Add "UNKNOWN: 5" in the "sleep_stage_annotations" due to manual remove "<Event channel..." annotations

# Prediction
ut predict --folder_regex '../processed/isruc_sg1/views/fixed_split/test/01-03-*' \
           --out_dir out_pred_test \
           --one_shot \
           --save_true \
           --weights_file_name 'model_weights.h5'
```

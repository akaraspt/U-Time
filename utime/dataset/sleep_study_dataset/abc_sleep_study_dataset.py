import numpy as np
from abc import ABC, abstractmethod
from utime import defaults
from mpunet.logging import ScreenLogger


class AbstractBaseSleepStudyDataset(ABC):
    """
    Represents a collection of SleepStudyBase objects
    """
    def __init__(self,
                 identifier,
                 pairs=None,
                 period_length_sec=None,
                 logger=None,
                 no_log=False):
        """
        Initialize a SleepStudyDataset from a directory storing one or more
        sub-directories each corresponding to a sleep/PSG study.
        Each sub-dir will be represented by a SleepStudyBase object.

        Args:
            pairs: TODO
            period_length_sec:       (int)    Ground truth segmentation
                                              period length in seconds.
            identifier:              (string) Dataset ID/name
            logger:                  (Logger) A Logger object
            no_log:                  (bool)   Do not log dataset details on init
        """
        self.logger = logger or ScreenLogger()
        self._identifier = identifier
        self._id_to_study = None
        self._study_identifiers = None
        self._pairs = pairs or []
        self._misc = {}  # May store arbitrary properties for this dataset
        self.period_length_sec = (period_length_sec or
                                  defaults.get_default_period_length(self.logger))

        # Get list of subject folders in the data_dir according to folder_regex
        if len(np.unique([p.identifier for p in self.pairs])) != len(self.pairs):
            raise RuntimeError("Two or more SleepStudyBase objects share the same"
                               " identifier, but all must be unique.")
        if self.pairs:
            self.update_id_to_study_dict()
        if not no_log:
            self.log()

    @abstractmethod
    def __str__(self):
        raise NotImplemented

    @abstractmethod
    def load(self, N=None, random_order=True):
        raise NotImplemented

    def log(self, message=None):
        """ Log basic properties about this dataset """
        id_msg = "[Dataset: {}]".format(self.identifier)
        if message is None:
            message = str(self)
        self.logger("{} {}".format(id_msg, message))

    @property
    def identifier(self):
        """ Returns the dataset ID string """
        return self._identifier

    @property
    def n_loaded(self):
        """ Returns the number of stored pairs that have data loaded """
        return len(self.loaded_pairs)

    @property
    def loaded_pairs(self):
        """ Returns stored SleepStudyBase objects that have data loaded """
        return [s for s in self if s.loaded]

    @property
    def non_loaded_pairs(self):
        """
        Returns stored SleepStudyBase objects that do not have data loaded
        """
        return [s for s in self if not s.loaded]

    @property
    def pairs(self):
        """ Return the stored SleepStudyBase pairs """
        return self._pairs

    @property
    def id_to_study(self):
        """ Returns the ID to SleepStudyBase object dictionary """
        return self._id_to_study

    @property
    def study_identifiers(self):
        """
        Returns a list of SleepStudyBase identifier strings matching the
        currently stored objects.
        """
        return self._study_identifiers

    @property
    def misc(self):
        """ Returns the stored misc. dictionary """
        return self._misc

    def add_pairs(self, pairs):
        """
        Add new SleepStudyBase pairs to this object.
        This method also recomputes the self.id_to_study dictionary
        """
        self._pairs.extend(pairs)
        self.update_id_to_study_dict()

    def update_id_to_study_dict(self):
        """
        Recompute the self.id_to_study dictionary based on the currently stored
        SleepStudyBase pairs.
        """
        self._id_to_study = {ss.identifier: ss for ss in self.pairs}
        self._study_identifiers = list(self.id_to_study.keys())

    def __len__(self):
        """ Returns the number of stored SleepStudyBase objects """
        return len(self.pairs)

    def __getitem__(self, item):
        """
        Return an element from the list of stored SleepStudyBase
        objects
        """
        return self.pairs[item]

    def __iter__(self):
        """ Yield elements from the list of stored SleepStudyBase objects """
        for pair in self.pairs:
            yield pair

    def unload(self):
        """ Invokes the unload method on all stored pairs """
        for ss in self:
            ss.unload()

    def get_by_id(self, sleep_study_id):
        """ Return a stored SleepStudyBase object by its ID string """
        if sleep_study_id not in self.id_to_study:
            raise ValueError("Did not find a match to id {}".format(sleep_study_id))
        else:
            return self.id_to_study[sleep_study_id]

    def get_all_periods(self, stack=False):
        """
        Returns the output of SleepStudyBase.get_all_periods across all stored
        SleepStudyBase objects either as a list with one element for each
        (stack=False) or as single, stacked arrays (stack=True)
        Please refer to SleepStudyBase.get_all_periods

        Returns:
            X: ndarray shape [-1, data_per_period, n_channels] (stack=True)
            y: ndarray shape [-1, 1] (stack=True)
        """
        loaded = self.loaded_pairs
        self.log("Getting all periods from {} loaded pairs ({} total pairs)"
                 "".format(len(loaded), len(self)))
        X, y = zip(*[s.get_all_periods() for s in loaded])
        if stack:
            X, y = np.vstack(X), np.vstack(y)
        return X, y

    def get_class_counts(self, n_classes, log=True):
        """
        Computes the sum of class count across all loaded SleepStudyBase objects

        Args:
            n_classes: Number of expected classes.
            log:       Log the results of the counting

        Returns:
            classes, ndarray, shape [n_classes] of class label integers
            counts, ndarray, shape [n_classes], of class label counts
        """
        if log:
            self.log("Counting class occurrences across {} loaded samples..."
                     .format(self.n_loaded))
        counts = {i: 0 for i in range(n_classes)}
        _, y = self.get_all_periods(stack=True)
        cls_ints, cls_counts = np.unique(y, return_counts=True)
        for cls_int, cls_count in zip(cls_ints, cls_counts):
            counts[cls_int] += cls_count
        cls, counts = zip(*counts.items())
        if log:
            self.log("Classes: {}\n"
                     "Counts:  {}".format(cls, counts))
        return cls, counts

    def set_select_channels(self, channels):
        """
        Sets the 'select_channels' property on all stored SleepStudyBase objects.
        Please refer to the SleepStudyBase.select_channels setter method
        """
        if channels is None or len(channels) == 0:
            return
        self.log("Setting select channels: {}".format(channels))
        for ss in self:
            ss.select_channels = channels

    def set_alternative_select_channels(self, channels):
        """
        Sets the 'alternative_select_channels' property on all stored
        SleepStudyBase objects. Please refer to the
        SleepStudyBase.alternative_select_channels setter method
        """
        if channels is None or len(channels) == 0:
            return
        self.log("Setting alternative select channels: {}".format(channels))
        for ss in self:
            ss.alternative_select_channels = channels

    def set_misc_dict(self, misc):
        """
        Sets an arbitrary dictionary of additional information to store on this
        dataset.

        Args:
            misc: A dictionary
        """
        self.log("Setting misc dictionary: {}".format(misc))
        self._misc = misc

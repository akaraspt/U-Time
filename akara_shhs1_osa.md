```
# After run shhs1_filter_subjects.ipynb

# Split
ut cv_split --data_dir './processed/shhs1_osa/' --subject_dir_pattern 'shhs1-*' --CV 1 --validation_fraction 0.10 --max_validation_subjects 100 --test_fraction 0.10 --max_test_subjects 100 --overwrite

# Initialize a U-Time project
ut init --name shhs1_osa_project \
        --model utime \
        --data_dir processed/shhs1_osa/views/fixed_split \
        --overwrite

# Train
cd shhs1_osa_project
ut train --num_gpus=2 --overwrite
# Required modification on `shhs1_project/hyperparameters/dataset_configuration/dataset_1.yaml`
#  - Change the "select_channels" and "alternative_select_channels" specify the channels (e.g., [F4-LER] and [F4-CLE])
#  - Change mapping for sleep stage 
#      W: 0
#      N1: 1
#      N2: 2
#      N3: 3
#      N4: 3
#      REM: 4
#  - Add "psg_regex: .*[.]h5" and "hyp_regex: .*[.]ids" in dataset_1.yaml
#  - Add "UNKNOWN: 5" in the "sleep_stage_annotations" due to manual remove "<Event channel..." annotations

# Prediction
ut predict --folder_regex '../processed/shhs1_project/views/fixed_split/test/shhs1-*' \
           --out_dir out_pred_test \
           --one_shot \
           --save_true \
           --weights_file_name 'model_weights.h5'
```

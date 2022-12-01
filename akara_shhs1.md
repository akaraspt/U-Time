```
# Extract data
ut extract --file_regex '/home/akara/Workspace/sleep_data/shhs/polysomnography/edfs/shhs1/*.edf' --out_dir './processed/shhs1/' --resample 128 --channels 'EEG' 'EEG(sec)' 'EEG2' 'EOG(L)' 'EOG(R)' --rename_channels 'C4-A1' 'C3-A2' 'C3-A2' 'EOG(L)-PG1' 'EOG(R)-PG1' --overwrite

# Extract label
ut extract_hypno --file_regex '/home/akara/Workspace/sleep_data/shhs/polysomnography/annotations-events-nsrr/shhs1/*.xml' --out_dir './processed/shhs1/annotations' --fill_blanks 'UNKNOWN' --overwrite

# Split
ut cv_split --data_dir './processed/shhs1/' --subject_dir_pattern 'shhs1-*' --CV 1 --validation_fraction 0.10 --max_validation_subjects 1000 --test_fraction 0.10 --max_test_subjects 1000 --overwrite

# Initialize a U-Time project
ut init --name shhs1_project \
        --model utime \
        --data_dir processed/shhs1/views/fixed_split \
        --overwrite

# Train
cd shhs1_project
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

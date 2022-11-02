```
# Extract data
ut extract --file_regex '/home/akara/Workspace/sleep_data/mass_raw/SS1/*PSG.edf' --out_dir './processed/mass_ss1/' --resample 128 --channels 'EEG F3-CLE' 'EEG F4-CLE' 'EEG C3-CLE' 'EEG C4-CLE' 'EEG O1-CLE' 'EEG O2-CLE' 'EEG F7-CLE' 'EEG F8-CLE' 'EEG T3-CLE' 'EEG T4-CLE' 'EEG T5-CLE' 'EEG T6-CLE' 'EEG P3-CLE' 'EEG P4-CLE' 'EEG Fz-CLE' 'EEG Cz-CLE' 'EEG Pz-CLE' 'EEG Fp1-CLE' 'EEG Fp2-CLE' 'EEG F3-LER' 'EEG F4-LER' 'EEG C3-LER' 'EEG C4-LER' 'EEG O1-LER' 'EEG O2-LER' 'EEG F7-LER' 'EEG F8-LER' 'EEG T3-LER' 'EEG T4-LER' 'EEG T5-LER' 'EEG T6-LER' 'EEG P3-LER' 'EEG P4-LER' 'EEG Fz-LER' 'EEG Cz-LER' 'EEG Pz-LER' 'EEG Fp1-LER' 'EEG Fp2-LER' 'EOG Left Horiz' 'EOG Right Horiz' --rename_channels 'F3-CLE' 'F4-CLE' 'C3-CLE' 'C4-CLE' 'O1-CLE' 'O2-CLE' 'F7-CLE' 'F8-CLE' 'T3-CLE' 'T4-CLE' 'T5-CLE' 'T6-CLE' 'P3-CLE' 'P4-CLE' 'Fz-CLE' 'Cz-CLE' 'Pz-CLE' 'Fp1-CLE' 'Fp2-CLE' 'F3-LER' 'F4-LER' 'C3-LER' 'C4-LER' 'O1-LER' 'O2-LER' 'F7-LER' 'F8-LER' 'T3-LER' 'T4-LER' 'T5-LER' 'T6-LER' 'P3-LER' 'P4-LER' 'Fz-LER' 'Cz-LER' 'Pz-LER' 'Fp1-LER' 'Fp2-LER' 'EOG_left_horizontal' 'EOG_right_horizontal' --overwrite

# Extract label
ut extract_hypno --file_regex '/home/akara/Workspace/sleep_data/mass_raw/SS1/annotations/*Annotations.edf' --out_dir './processed/mass_ss1/' --overwrite --fill_blanks 'UNKNOWN'

# Split
ut cv_split --data_dir './processed/mass_ss1/' --subject_dir_pattern '01-01-*PSG' --CV 1 --validation_fraction 0.10 --max_validation_subjects 100 --test_fraction 0.10 --max_test_subjects 100 --overwrite

# Initialize a U-Time project
ut init --name mass_ss1_project \
        --model utime \
        --data_dir processed/mass_ss1/views/fixed_split \
        --overwrite

# Train
cd mass_ss3_project
ut train --num_gpus=2 --overwrite
# Required modification on `mass_ss3_project/hyperparameters/dataset_configuration/dataset_1.yaml`
#  - Change the "select_channels" and "alternative_select_channels" specify the channels (e.g., [F4-LER] and [F4-CLE])
#  - Add "psg_regex: .*[.]h5" and "hyp_regex: .*[.]ids" in dataset_1.yaml
#  - Add "UNKNOWN: 5" in the "sleep_stage_annotations" due to manual remove "<Event channel..." annotations

# Prediction
ut predict --folder_regex '../processed/mass_ss1/views/fixed_split/test/01-01-*' \
           --out_dir out_pred_test \
           --one_shot \
           --save_true \
           --weights_file_name 'model_weights.h5'
```

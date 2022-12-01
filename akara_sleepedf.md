```
# Extract data
ut extract --file_regex '/home/akara/Workspace/sleep_data/sleepedf/sleep-cassette/*PSG.edf' --out_dir './processed/sedf_sc/' --resample 128 --channels 'EEG Fpz-Cz' 'EEG Pz-Oz' 'EOG horizontal' --rename Fpz-Cz Pz-Oz EOG --overwrite

# Extract label
ut extract_hypno --file_regex '/home/akara/Workspace/sleep_data/sleepedf/sleep-cassette/*Hypnogram.edf' --out_dir './processed/sedf_sc/'

# Split
ut cv_split --data_dir './processed/sedf_sc/' --subject_dir_pattern 'SC*' --CV 1 --validation_fraction 0.10 --max_validation_subjects 2 --test_fraction 0.2 --max_test_subjects 4 --subject_matching_regex 'SC4(\d{2}).*'

# Initialize a U-Time project
ut init --name sedf_sc_project \
        --model utime \
        --data_dir processed/sedf_sc/views/fixed_split

# Train
cd sedf_sc_project
ut train --num_gpus=2 --overwrite

# Prediction
ut predict --folder_regex '../processed/sedf_sc/views/fixed_split/test/SC4*' \
           --out_dir out_pred_test \
           --one_shot \
           --save_true \
           --weights_file_name 'model_weights.h5'

ut predict --folder_regex '../processed/sedf_sc/views/fixed_split/test/SC4*' \
           --out_dir out_pred_temp \
           --one_shot \
           --save_true \
           --weights_file_name '/home/akara/Workspace/U-Time/isruc1_c3-a2_project/model/model_weights.h5'
```

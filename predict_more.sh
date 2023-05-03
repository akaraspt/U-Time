cd tf_shhs1_normal_c4-a1_project__to__shhs1_osa_c4-a1_project
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_normal_c4-a1_project__to__shhs1_osa_c4-a1_project_type3_2 --weights_file_name '../shhs1_normal_c4-a1_project/model/@epoch_104_val_dice_0.65880.h5' --overwrite
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_normal_c4-a1_project__to__shhs1_osa_c4-a1_project_type6_2 --weights_file_name '../shhs1_osa_c4-a1_project/model/@epoch_379_val_dice_0.73010.h5' --overwrite
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_normal_c4-a1_project__to__shhs1_osa_c4-a1_project_type9_2 --weights_file_name './model/@epoch_85_val_dice_0.73040.h5' --overwrite
cd ..
cd tf_shhs1_osa_c4-a1_project__to__shhs1_normal_c4-a1_project
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_osa_c4-a1_project__to__shhs1_normal_c4-a1_project_type3_2 --weights_file_name '../shhs1_osa_c4-a1_project/model/@epoch_379_val_dice_0.73010.h5' --overwrite
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_osa_c4-a1_project__to__shhs1_normal_c4-a1_project_type6_2 --weights_file_name '../shhs1_normal_c4-a1_project/model/@epoch_104_val_dice_0.65880.h5' --overwrite
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_osa_c4-a1_project__to__shhs1_normal_c4-a1_project_type9_2 --weights_file_name './model/@epoch_133_val_dice_0.69460.h5' --overwrite
cd ..
cd tf_shhs1_normal_c4-a1_project__to__shhs1_osa_c4-a1_project
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_normal_c4-a1_project__to__shhs1_osa_c4-a1_project_type3_3 --weights_file_name '../shhs1_normal_c4-a1_project/model/@epoch_105_val_dice_0.65060.h5' --overwrite
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_normal_c4-a1_project__to__shhs1_osa_c4-a1_project_type6_3 --weights_file_name '../shhs1_osa_c4-a1_project/model/@epoch_380_val_dice_0.73050.h5' --overwrite
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_normal_c4-a1_project__to__shhs1_osa_c4-a1_project_type9_3 --weights_file_name './model/@epoch_86_val_dice_0.73580.h5' --overwrite
cd ..
cd tf_shhs1_osa_c4-a1_project__to__shhs1_normal_c4-a1_project
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_osa_c4-a1_project__to__shhs1_normal_c4-a1_project_type3_3 --weights_file_name '../shhs1_osa_c4-a1_project/model/@epoch_380_val_dice_0.73050.h5' --overwrite
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_osa_c4-a1_project__to__shhs1_normal_c4-a1_project_type6_3 --weights_file_name '../shhs1_normal_c4-a1_project/model/@epoch_105_val_dice_0.65060.h5' --overwrite
ut predict --one_shot --save_true --out_dir ../predictions/shhs1_osa_c4-a1_project__to__shhs1_normal_c4-a1_project_type9_3 --weights_file_name './model/@epoch_134_val_dice_0.70070.h5' --overwrite
cd ..
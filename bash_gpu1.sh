ut init --name sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz
cd ..
ut init --name tf_sleepedf_fpz-cz_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_sleepedf_fpz-cz_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../sleepedf_fpz-cz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_fpz-cz_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_sleepedf_fpz-cz_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../sleepedf_fpz-cz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_fpz-cz_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_sleepedf_fpz-cz_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../sleepedf_fpz-cz_project/model/model_weights.h5
cd ..
ut init --name sleepedf_pz-oz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd sleepedf_pz-oz_project
ut train --num_gpus=1 --force_gpu=1 --channels Pz-Oz
cd ..
ut init --name tf_sleepedf_pz-oz_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_sleepedf_pz-oz_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../sleepedf_pz-oz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_pz-oz_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_sleepedf_pz-oz_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../sleepedf_pz-oz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_pz-oz_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_sleepedf_pz-oz_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../sleepedf_pz-oz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_pz-oz_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_sleepedf_pz-oz_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../sleepedf_pz-oz_project/model/model_weights.h5
cd ..
ut init --name isruc1_c4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd isruc1_c4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-A1
cd ..
ut init --name tf_isruc1_c4-a1_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_isruc1_c4-a1_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../isruc1_c4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_isruc1_c4-a1_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_isruc1_c4-a1_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../isruc1_c4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_isruc1_c4-a1_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_isruc1_c4-a1_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../isruc1_c4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_isruc1_c4-a1_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_isruc1_c4-a1_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../isruc1_c4-a1_project/model/model_weights.h5
cd ..
ut init --name isruc1_f3-a2_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd isruc1_f3-a2_project
ut train --num_gpus=1 --force_gpu=1 --channels F3-A2
cd ..
ut init --name tf_isruc1_f3-a2_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_isruc1_f3-a2_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../isruc1_f3-a2_project/model/model_weights.h5
cd ..
ut init --name isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1
cd ..
ut init --name tf_isruc1_f4-a1_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_isruc1_f4-a1_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../isruc1_f4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_isruc1_f4-a1_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_isruc1_f4-a1_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../isruc1_f4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_isruc1_f4-a1_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_isruc1_f4-a1_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../isruc1_f4-a1_project/model/model_weights.h5
cd ..
ut init --name isruc1_o2-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd isruc1_o2-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels O2-A1
cd ..
ut init --name tf_isruc1_o2-a1_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_isruc1_o2-a1_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../isruc1_o2-a1_project/model/model_weights.h5
cd ..
ut init --name tf_isruc1_o2-a1_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_isruc1_o2-a1_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../isruc1_o2-a1_project/model/model_weights.h5
cd ..
ut init --name tf_isruc1_o2-a1_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_isruc1_o2-a1_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../isruc1_o2-a1_project/model/model_weights.h5
cd ..
ut init --name tf_isruc1_o2-a1_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_isruc1_o2-a1_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../isruc1_o2-a1_project/model/model_weights.h5
cd ..
ut init --name mass_ss1_c4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd mass_ss1_c4_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-CLE --alt_channels C4-LER
cd ..
ut init --name tf_mass_ss1_c4_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_mass_ss1_c4_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../mass_ss1_c4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_c4_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_mass_ss1_c4_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../mass_ss1_c4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_c4_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_mass_ss1_c4_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss1_c4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_c4_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_mass_ss1_c4_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss1_c4_project/model/model_weights.h5
cd ..
ut init --name mass_ss1_f3_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd mass_ss1_f3_project
ut train --num_gpus=1 --force_gpu=1 --channels F3-CLE --alt_channels F3-LER
cd ..
ut init --name tf_mass_ss1_f3_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_mass_ss1_f3_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss1_f3_project/model/model_weights.h5
cd ..
ut init --name mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER
cd ..
ut init --name tf_mass_ss1_f4_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_mass_ss1_f4_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../mass_ss1_f4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_f4_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_mass_ss1_f4_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../mass_ss1_f4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_f4_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_mass_ss1_f4_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss1_f4_project/model/model_weights.h5
cd ..
ut init --name mass_ss1_o2_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd mass_ss1_o2_project
ut train --num_gpus=1 --force_gpu=1 --channels O2-CLE --alt_channels O2-LER
cd ..
ut init --name tf_mass_ss1_o2_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_mass_ss1_o2_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../mass_ss1_o2_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_o2_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_mass_ss1_o2_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../mass_ss1_o2_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_o2_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_mass_ss1_o2_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss1_o2_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_o2_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_mass_ss1_o2_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss1_o2_project/model/model_weights.h5
cd ..
ut init --name mass_ss1_pz_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd mass_ss1_pz_project
ut train --num_gpus=1 --force_gpu=1 --channels Pz-CLE --alt_channels Pz-LER
cd ..
ut init --name tf_mass_ss1_pz_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_mass_ss1_pz_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../mass_ss1_pz_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_pz_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_mass_ss1_pz_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../mass_ss1_pz_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_pz_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_mass_ss1_pz_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss1_pz_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss1_pz_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_mass_ss1_pz_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss1_pz_project/model/model_weights.h5
cd ..
ut init --name mass_ss2_c4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd mass_ss2_c4_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-CLE --alt_channels C4-LER
cd ..
ut init --name tf_mass_ss2_c4_project__to__mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd tf_mass_ss2_c4_project__to__mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss2_c4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss2_c4_project__to__mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd tf_mass_ss2_c4_project__to__mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss2_c4_project/model/model_weights.h5
cd ..
ut init --name mass_ss2_f3_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd mass_ss2_f3_project
ut train --num_gpus=1 --force_gpu=1 --channels F3-CLE --alt_channels F3-LER
cd ..
ut init --name tf_mass_ss2_f3_project__to__mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd tf_mass_ss2_f3_project__to__mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss2_f3_project/model/model_weights.h5
cd ..
ut init --name mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER
cd ..
ut init --name tf_mass_ss2_f4_project__to__mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd tf_mass_ss2_f4_project__to__mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss2_f4_project/model/model_weights.h5
cd ..
ut init --name mass_ss2_o2_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd mass_ss2_o2_project
ut train --num_gpus=1 --force_gpu=1 --channels O2-CLE --alt_channels O2-LER
cd ..
ut init --name tf_mass_ss2_o2_project__to__mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd tf_mass_ss2_o2_project__to__mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss2_o2_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss2_o2_project__to__mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd tf_mass_ss2_o2_project__to__mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss2_o2_project/model/model_weights.h5
cd ..
ut init --name mass_ss2_pz_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd mass_ss2_pz_project
ut train --num_gpus=1 --force_gpu=1 --channels Pz-CLE --alt_channels Pz-LER
cd ..
ut init --name tf_mass_ss2_pz_project__to__mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd tf_mass_ss2_pz_project__to__mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss2_pz_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss2_pz_project__to__mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd tf_mass_ss2_pz_project__to__mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss2_pz_project/model/model_weights.h5
cd ..
ut init --name mass_ss3_c4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd mass_ss3_c4_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-CLE --alt_channels C4-LER
cd ..
ut init --name tf_mass_ss3_c4_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_mass_ss3_c4_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../mass_ss3_c4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_c4_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_mass_ss3_c4_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../mass_ss3_c4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_c4_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_mass_ss3_c4_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss3_c4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_c4_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_mass_ss3_c4_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss3_c4_project/model/model_weights.h5
cd ..
ut init --name mass_ss3_f3_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd mass_ss3_f3_project
ut train --num_gpus=1 --force_gpu=1 --channels F3-CLE --alt_channels F3-LER
cd ..
ut init --name tf_mass_ss3_f3_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_mass_ss3_f3_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss3_f3_project/model/model_weights.h5
cd ..
ut init --name mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER
cd ..
ut init --name tf_mass_ss3_f4_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_mass_ss3_f4_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../mass_ss3_f4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_f4_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_mass_ss3_f4_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../mass_ss3_f4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_f4_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_mass_ss3_f4_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss3_f4_project/model/model_weights.h5
cd ..
ut init --name mass_ss3_o2_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd mass_ss3_o2_project
ut train --num_gpus=1 --force_gpu=1 --channels O2-CLE --alt_channels O2-LER
cd ..
ut init --name tf_mass_ss3_o2_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_mass_ss3_o2_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../mass_ss3_o2_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_o2_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_mass_ss3_o2_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../mass_ss3_o2_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_o2_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_mass_ss3_o2_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss3_o2_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_o2_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_mass_ss3_o2_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss3_o2_project/model/model_weights.h5
cd ..
ut init --name mass_ss3_pz_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd mass_ss3_pz_project
ut train --num_gpus=1 --force_gpu=1 --channels Pz-CLE --alt_channels Pz-LER
cd ..
ut init --name tf_mass_ss3_pz_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_mass_ss3_pz_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../mass_ss3_pz_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_pz_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_mass_ss3_pz_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../mass_ss3_pz_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_pz_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_mass_ss3_pz_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss3_pz_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss3_pz_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_mass_ss3_pz_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss3_pz_project/model/model_weights.h5
cd ..
ut init --name mass_ss4_c4_project --model utime --data_dir ./processed/mass_ss4/views/fixed_split
cd mass_ss4_c4_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-CLE --alt_channels C4-LER
cd ..
ut init --name tf_mass_ss4_c4_project__to__mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd tf_mass_ss4_c4_project__to__mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss4_c4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss4_c4_project__to__mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd tf_mass_ss4_c4_project__to__mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss4_c4_project/model/model_weights.h5
cd ..
ut init --name mass_ss4_o2_project --model utime --data_dir ./processed/mass_ss4/views/fixed_split
cd mass_ss4_o2_project
ut train --num_gpus=1 --force_gpu=1 --channels O2-CLE --alt_channels O2-LER
cd ..
ut init --name tf_mass_ss4_o2_project__to__mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd tf_mass_ss4_o2_project__to__mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss4_o2_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss4_o2_project__to__mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd tf_mass_ss4_o2_project__to__mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss4_o2_project/model/model_weights.h5
cd ..
ut init --name mass_ss5_c4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd mass_ss5_c4_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-CLE --alt_channels C4-LER
cd ..
ut init --name tf_mass_ss5_c4_project__to__mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd tf_mass_ss5_c4_project__to__mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss5_c4_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss5_c4_project__to__mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd tf_mass_ss5_c4_project__to__mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss5_c4_project/model/model_weights.h5
cd ..
ut init --name mass_ss5_f3_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd mass_ss5_f3_project
ut train --num_gpus=1 --force_gpu=1 --channels F3-CLE --alt_channels F3-LER
cd ..
ut init --name tf_mass_ss5_f3_project__to__mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd tf_mass_ss5_f3_project__to__mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss5_f3_project/model/model_weights.h5
cd ..
ut init --name mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER
cd ..
ut init --name tf_mass_ss5_f4_project__to__mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd tf_mass_ss5_f4_project__to__mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss5_f4_project/model/model_weights.h5
cd ..
ut init --name mass_ss5_o2_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd mass_ss5_o2_project
ut train --num_gpus=1 --force_gpu=1 --channels O2-CLE --alt_channels O2-LER
cd ..
ut init --name tf_mass_ss5_o2_project__to__mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd tf_mass_ss5_o2_project__to__mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss5_o2_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss5_o2_project__to__mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd tf_mass_ss5_o2_project__to__mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss5_o2_project/model/model_weights.h5
cd ..
ut init --name mass_ss5_pz_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd mass_ss5_pz_project
ut train --num_gpus=1 --force_gpu=1 --channels Pz-CLE --alt_channels Pz-LER
cd ..
ut init --name tf_mass_ss5_pz_project__to__mass_ss2_f4_project --model utime --data_dir ./processed/mass_ss2/views/fixed_split
cd tf_mass_ss5_pz_project__to__mass_ss2_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss5_pz_project/model/model_weights.h5
cd ..
ut init --name tf_mass_ss5_pz_project__to__mass_ss5_f4_project --model utime --data_dir ./processed/mass_ss5/views/fixed_split
cd tf_mass_ss5_pz_project__to__mass_ss5_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../mass_ss5_pz_project/model/model_weights.h5
cd ..
ut init --name shhs1_normal_c4-a1_project --model utime --data_dir ./processed/shhs1_nor/views/fixed_split
cd shhs1_normal_c4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-A1
cd ..
ut init --name tf_shhs1_normal_c4-a1_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_shhs1_normal_c4-a1_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../shhs1_normal_c4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_shhs1_normal_c4-a1_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_shhs1_normal_c4-a1_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../shhs1_normal_c4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_shhs1_normal_c4-a1_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_shhs1_normal_c4-a1_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../shhs1_normal_c4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_shhs1_normal_c4-a1_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_shhs1_normal_c4-a1_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../shhs1_normal_c4-a1_project/model/model_weights.h5
cd ..
ut init --name shhs1_osa_c4-a1_project --model utime --data_dir ./processed/shhs1_osa/views/fixed_split
cd shhs1_osa_c4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-A1
cd ..
ut init --name tf_shhs1_osa_c4-a1_project__to__sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd tf_shhs1_osa_c4-a1_project__to__sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz --initialize_from ../shhs1_osa_c4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_shhs1_osa_c4-a1_project__to__isruc1_f4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_shhs1_osa_c4-a1_project__to__isruc1_f4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-A1 --initialize_from ../shhs1_osa_c4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_shhs1_osa_c4-a1_project__to__mass_ss1_f4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_shhs1_osa_c4-a1_project__to__mass_ss1_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../shhs1_osa_c4-a1_project/model/model_weights.h5
cd ..
ut init --name tf_shhs1_osa_c4-a1_project__to__mass_ss3_f4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_shhs1_osa_c4-a1_project__to__mass_ss3_f4_project
ut train --num_gpus=1 --force_gpu=1 --channels F4-CLE --alt_channels F4-LER --initialize_from ../shhs1_osa_c4-a1_project/model/model_weights.h5
cd ..
ut init --name sleepedf_fpz-cz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd sleepedf_fpz-cz_project
ut train --num_gpus=1 --force_gpu=1 --channels Fpz-Cz
cd ..
ut init --name tf_sleepedf_fpz-cz_project__to__isruc1_c4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_sleepedf_fpz-cz_project__to__isruc1_c4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-A1 --initialize_from ../sleepedf_fpz-cz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_fpz-cz_project__to__mass_ss1_c4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_sleepedf_fpz-cz_project__to__mass_ss1_c4_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-CLE --alt_channels C4-LER --initialize_from ../sleepedf_fpz-cz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_fpz-cz_project__to__mass_ss3_c4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_sleepedf_fpz-cz_project__to__mass_ss3_c4_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-CLE --alt_channels C4-LER --initialize_from ../sleepedf_fpz-cz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_fpz-cz_project__to__shhs1_normal_c4-a1_project --model utime --data_dir ./processed/shhs1_nor/views/fixed_split
cd tf_sleepedf_fpz-cz_project__to__shhs1_normal_c4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-A1 --initialize_from ../sleepedf_fpz-cz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_fpz-cz_project__to__shhs1_osa_c4-a1_project --model utime --data_dir ./processed/shhs1_osa/views/fixed_split
cd tf_sleepedf_fpz-cz_project__to__shhs1_osa_c4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-A1 --initialize_from ../sleepedf_fpz-cz_project/model/model_weights.h5
cd ..
ut init --name sleepedf_pz-oz_project --model utime --data_dir ./processed/sedf_sc/views/fixed_split
cd sleepedf_pz-oz_project
ut train --num_gpus=1 --force_gpu=1 --channels Pz-Oz
cd ..
ut init --name tf_sleepedf_pz-oz_project__to__isruc1_c4-a1_project --model utime --data_dir ./processed/isruc_sg1/views/fixed_split
cd tf_sleepedf_pz-oz_project__to__isruc1_c4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-A1 --initialize_from ../sleepedf_pz-oz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_pz-oz_project__to__mass_ss1_c4_project --model utime --data_dir ./processed/mass_ss1/views/fixed_split
cd tf_sleepedf_pz-oz_project__to__mass_ss1_c4_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-CLE --alt_channels C4-LER --initialize_from ../sleepedf_pz-oz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_pz-oz_project__to__mass_ss3_c4_project --model utime --data_dir ./processed/mass_ss3/views/fixed_split
cd tf_sleepedf_pz-oz_project__to__mass_ss3_c4_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-CLE --alt_channels C4-LER --initialize_from ../sleepedf_pz-oz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_pz-oz_project__to__shhs1_normal_c4-a1_project --model utime --data_dir ./processed/shhs1_nor/views/fixed_split
cd tf_sleepedf_pz-oz_project__to__shhs1_normal_c4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-A1 --initialize_from ../sleepedf_pz-oz_project/model/model_weights.h5
cd ..
ut init --name tf_sleepedf_pz-oz_project__to__shhs1_osa_c4-a1_project --model utime --data_dir ./processed/shhs1_osa/views/fixed_split
cd tf_sleepedf_pz-oz_project__to__shhs1_osa_c4-a1_project
ut train --num_gpus=1 --force_gpu=1 --channels C4-A1 --initialize_from ../sleepedf_pz-oz_project/model/model_weights.h5
cd ..

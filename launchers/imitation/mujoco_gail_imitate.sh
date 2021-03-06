#!/usr/bin/env bash
# Example: ./mujoco_gail_imitate.sh <num_mpi_workers> <env_id> <expert_demos_path> <num_demos>

cd ../..

mpirun -np $1 --allow-run-as-root python -m imitation.imitation_algorithms.run_gail \
    --note="" \
    --env_id=$2 \
    --no-from_raw_pixels \
    --seed=0 \
    --checkpoint_dir="data/imitation_checkpoints" \
    --summary_dir="data/summaries" \
    --log_dir="data/logs" \
    --task="imitate_via_gail" \
    --expert_path=$3 \
    --rmsify_obs \
    --save_frequency=100 \
    --num_iters=1000000 \
    --timesteps_per_batch=1024 \
    --batch_size=128 \
    --sample_or_mode \
    --num_demos=$4 \
    --g_steps=3 \
    --d_steps=1 \
    --no-non_satur_grad \
    --pol_hid_widths 100 100 \
    --d_hid_widths 100 100 \
    --hid_nonlin="tanh" \
    --hid_w_init="xavier_normal" \
    --gaussian_fixed_var \
    --no-with_layernorm \
    --max_kl=0.01 \
    --pol_ent_reg_scale=0. \
    --d_ent_reg_scale=0. \
    --label_smoothing \
    --one_sided_label_smoothing \
    --vf_lr=3e-4 \
    --d_lr=3e-4 \
    --gamma=0.995 \
    --gae_lambda=0.99

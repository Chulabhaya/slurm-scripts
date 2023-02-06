#!/bin/bash

# --- Path to sbatch script for launching job
sbatch_path="test2.sbatch"
job_name="test_experiment"

# --- Loop over each seed and launch job
for i in {0..4}
do
    # --- Create seed
    seed_offset=100
    seed=$((${i} + ${seed_offset}))
    individual_job_name=${job_name}_seed_${seed}_time_$(date +%s)
    echo "Running job: ${individual_job_name}"

    # --- Call sbatch script
    sbatch --output=/work/llpr/wijesundara.c/experiment_results/slurm_logs/${individual_job_name}.%j.out \
    --error=/work/llpr/wijesundara.c/experiment_results/slurm_logs/${individual_job_name}.%j.err \
    --job-name=${individual_job_name} \
    ${sbatch_path} ${seed} ${individual_job_name}

    # --- Pause to be kind to the scheduler
    sleep 2
done
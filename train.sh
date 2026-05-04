#!/bin/bash
#$ -N diffusion_job
#$ -P dl4ds
#$ -l h_rt=12:00:00
#$ -pe omp 4
#$ -l gpus=1
#$ -l gpu_c=8.0
#$ -cwd
#$ -j y
#$ -o train_output.log

echo "Starting job"
echo "Host: $(hostname)"
echo "Working directory: $(pwd)"
echo "Python: $(which python)"

python -c "import torch; print('CUDA available:', torch.cuda.is_available()); print('GPU:', torch.cuda.get_device_name(0) if torch.cuda.is_available() else 'no cuda')"

python project4.py

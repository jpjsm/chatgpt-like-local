#!/bin/bash
# /home/llm/run_chatgpt_local_service.sh

# Activate conda environment
source /home/llm/miniconda3/etc/profile.d/conda.sh
conda init
conda activate chatgpt-like-local-pi312-cu128

# Run your app
 vllm serve /models/mistral-7b-local --served-model-name mistral-7b-local --max-model-len 1024 --gpu-memory-utilization 0.95 --port 12347


#!/bin/bash

docker run --runtime nvidia --gpus all \
    -v ~/.cache/huggingface:/root/.cache/huggingface \
    --env "HUGGING_FACE_HUB_TOKEN=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" \
    -p 8000:8000 \
    --ipc=host \
    vllm/vllm-openai:latest \
    --model mistralai/Codestral-22B-v0.1 \
    --max_model_len 8192 \
    --max_num_seqs 1 \
    --gpu_memory_utilization 0.7 \
    --dtype float16 \
    --quantization fp8 \
    --disable-sliding-window \
    --tensor_parallel_size 1 \
    --pipeline_parallel_size 1 \
    --disable-log-stats

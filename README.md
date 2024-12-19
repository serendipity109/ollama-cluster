# [Minikube with GPU](https://minikube.sigs.k8s.io/docs/tutorials/nvidia/)

# 啟動 minikube
```bash
minikube start --driver docker --container-runtime docker --cpus=12 --memory=48g --gpus all
```

# 本地image載入
```bash
docker pull ollama/ollama:latest
minikube image load ollama/ollama:latest
```

# 啟動服務
```bash
kubectl apply -f ollama-service.yaml
```

# Check status
```bash
kubectl get pods
kubectl get svc
```

# pod內訪問服務
```bash
ollama run llama3
```

# Restart deployment
```bash
kubectl rollout restart deployment/ollama
```

# 關掉 Pod Deployment
```bash
kubectl scale deployment ollama --replicas=0
```


# 轉發loadbalancer出去
```bash
minikube tunnel --cleanup

sudo apt-get install socat
sudo socat TCP-LISTEN:11434,fork TCP:192.168.49.2:30424
```

# Request
```bash
# ollama
curl http://172.21.31.219:11434/api/generate -d '{
  "model": "codestral",
  "prompt": "hi"
}'

curl http://192.168.49.2:30424/api/generate -d '{
  "model": "codestral",
  "prompt": "hi"
}'

# vllm
curl http://mistral-7b:8000/v1/completions \  -H "Content-Type: application/json" \  -d '{        "model": "mistralai/Mistral-7B-Instruct-v0.3",        "prompt": "San Francisco is a",        "max_tokens": 7,        "temperature": 0      
}'
```


# 關掉 Minikube
```bash
minikube delete
```
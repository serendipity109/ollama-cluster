# [Minikube with GPU](https://minikube.sigs.k8s.io/docs/tutorials/nvidia/)

# 啟動
```bash
minikube start --driver docker --container-runtime docker --gpus all

kubectl apply -f ollama-deployment.yaml
```

# Check status
```bash
kubectl get pods
kubectl get services
```

# 訪問服務
```bash
ollama run llama3
```

# Port forward
```bash
./port-forward.sh
```

# Request
```bash
curl -X POST http://localhost:11434/api/generate -d '{
  "model": "codestral",
  "prompt": "hi"
}'
```

# 關掉 Pod Deployment
```bash
kubectl scale deployment ollama --replicas=0
```

# 關掉 Minikube
```bash
minikube delete
```
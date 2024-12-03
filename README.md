# [Minikube with GPU](https://minikube.sigs.k8s.io/docs/tutorials/nvidia/)

# 啟動
```bash
minikube start --driver docker --container-runtime docker --gpus all

kubectl apply -f ollama-deployment.yaml
```

# 訪問服務
```bash
ollama run llama3
```

# Port forward
```bash
kubectl port-forward --address 0.0.0.0 deployment/ollama 11434:11434
```

# 關掉 Pod Deployment
```bash
kubectl scale deployment ollama --replicas=0
```

# 關掉 Minikube
```bash
minikube delete
```
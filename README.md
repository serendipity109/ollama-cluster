# [Minikube with GPU](https://minikube.sigs.k8s.io/docs/tutorials/nvidia/)

# 啟動
```bash
kubectl apply -f ollama-deployment.yaml
```

# 訪問服務
```bash
ollama run llama3
```

# 關掉 Pod Deployment
```bash
kubectl scale deployment ollama --replicas=0
```
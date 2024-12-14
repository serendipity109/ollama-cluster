minikube start --driver docker --container-runtime docker --cpus=12 --memory=48g --gpus all

kubectl apply -f pv.yaml

kubectl apply -f pvc.yaml

kubectl apply -f hf-token-secret.yaml

kubectl apply -f deployment.yaml

kubectl apply -f service.yaml
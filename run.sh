# Start minikube
minikube start --kubernetes-version=v1.15.0

# Set docker env to get local image
eval $(minikube docker-env)

# Build image
docker build -t load-emulator:latest .

# Run in minikube
kubectl apply -f load-emulator.k8s.yaml

# Run autoscaler
kubectl autoscale deployment loademulator-deployment --cpu-percent=50 --min=1 --max=3

# Check that it's running
kubectl get pods

# Expose ports to access it from the external machine
kubectl expose deployment loademulator-deployment --type=LoadBalancer --port=5000

# Access the service
minikube service loademulator-deployment

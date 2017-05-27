## RabbitMQ Cluster in Docker
This setup a RabbitMQ Cluster in docker and kubernetes.

### docker-compose

```bash
./up.sh
```

### Kubernetes

```bash
cd k8s
kubectl create -f rabbitmq-svc.yaml
kubectl create -f rabbitmq-management-svc.yaml
kubectl create -f rabbitmq-statefulset.yaml

```

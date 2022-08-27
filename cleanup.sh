kubectl delete -f ./deployment/deployment.yaml.template --force --grace-period 0
kubectl delete ns webhook-demo --force --grace-period 0

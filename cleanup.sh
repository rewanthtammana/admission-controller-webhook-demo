kubectl delete -f ./deployment/deployment.yaml.template
kubectl delete ns webhook-demo --force --grace-period 0

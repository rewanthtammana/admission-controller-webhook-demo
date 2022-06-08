kubectl run nginx --image nginx
kubectl get po nginx -o=jsonpath='{.spec.containers[].image}{"\n"}'
kubectl delete po nginx --force --grace-period 0

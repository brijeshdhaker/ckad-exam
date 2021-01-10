# Get the pods with label information
kubectl get pods --show-labels

#


kubectl run nginx-dev1 --image=nginx --restart=Never --labels=env=dev
kubectl run nginx-dev2 --image=nginx --restart=Never --labels=env=dev
kubectl run nginx-dev3 --image=nginx --restart=Never --labels=env=dev

kubectl run nginx-uat1 --image=nginx --restart=Never --labels=env=uat
kubectl run nginx-uat2 --image=nginx --restart=Never --labels=env=uat

kubectl run nginx-prod1 --image=nginx --restart=Never --labels=env=prod
kubectl run nginx-prod2 --image=nginx --restart=Never --labels=env=prod


kubectl delete pod nginx-dev{1..3} --grace-period=0 --force

#
# Deploy pod on specific node
#

```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
spec:
## ---
  nodeSelector:
    nodeName: nginxnode
## ---
  containers:
  - image: nginx
    name: nginx
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Never
status: {}
```


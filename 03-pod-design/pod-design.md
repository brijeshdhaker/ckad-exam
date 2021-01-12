# Pod Design (20%)
## Practice questions based on these concepts
1. Understand how to use Labels, Selectors and Annotations
2. Understand Deployments and how to perform rolling updates
3. Understand Deployments and how to perform rollbacks
4. Understand Jobs and CronJobs

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

## Change Labels
kubectl label po nginx-dev2 env=dev2 --overwrite

kubectl delete pod nginx-dev{1..3} --grace-period=0 --force

kubectl get po -L app
# or
kubectl get po --label-columns=app

kubectl get po -l app=v2
# or
kubectl get po -l 'app in (v2)'
# or
kubectl get po --selector=app=v2



#
# Deploy pod on specific node
# Create a pod that will be deployed to a Node that has the label 'accelerator=nvidia-tesla-p100'

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
    accelerator: nvidia-tesla-p100
## ---
  containers:
  - image: nginx
    name: nginx
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Never
status: {}
```


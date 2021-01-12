
kubectl create quota test 
--hard=count/deployments.apps=2,count/replicasets.apps=4,count/pods=3,count/secrets=4 
--namespace=myspace


# CKAD Certification 
**A Complete Guide for CKAD Certification**


## 4. Observability - 18%

### Question 1 : Create a pod myredis with image redis. Define a liveness probe and readiness probe with an initial delay of 5 seconds and command redis-cli PING.
<details><summary>show</summary>
<p>

```bash
kubectl run myredis --image=redis --dry-run=client -o yaml > 4.1-myredis.yaml
vi 4.1-myredis.yaml
kubectl apply -f 4.1-myredis.yaml
```
```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: myredis
  name: myredis
spec:
  containers:
  - image: redis
    name: myredis
    livenessProbe:
	initialDelaySeconds: 3
      exec:
        command:
          - redis-cli 
          - PING
    readinessProbe:
      exec:
        command:
          - redis-cli 
          - PING          
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```
</p>
</details>

### Question 2 : Create a pod httptest with image kennethreitz/httpbin. Define a readiness probe at path /status/200 on port 80 of the container.
<details><summary>show</summary>
<p>

```bash
kubectl run httptest --image:kennethreitz/httpbin --dry-run=client -o yaml > 4.2-httptest-pod.yaml
vi 4.2-httptest-pod.yaml
kubectl apply -f 4.2-httptest-pod.yaml
```
```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: httptest
  name: httptest
spec:
  containers:
  - image: kennethreitz/httpbin
    name: httpbin
    readinessProbe:
      httpGet:
        path: /status/200
        port: 80  
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
``` 
</p>
</details>

### Question 3 : 
#### 1. Create a Pod named myenv with command sh -c "printenv && sleep 1h". Use alpine image.
#### 2. Save the logs of the pod to /root/myenv.log file.
#### 3. Delete myenv pod.
<details><summary>show</summary>
<p>

```bash
kubectl run myenv --image=alpine --dry-run=client -o yaml -- sh -c "printenv && sleep 1h" > 4.3-myenv-pod.yaml
kubectl apply -f 4.3-myenv-pod.yaml
kubectl get log myenv > /root/myenv.log
lubectl delete pod myenv
```
```YAML
``` 
</p>
</details>


### Question 4 : A pod named tatooine is created. But looks like its crashing. Fix it. The pod should be in running state. Recreate the pods if necessary.
<details><summary>show</summary>
<p>

```bash

```
```YAML
``` 
</p>
</details>

### Question 5 : A pod specification file is /root/coruscant.yaml. We tried to create a pod using it, but it didn't worked. Fix the spec file and create a pod using the spec file.
<details><summary>show</summary>
<p>

```bash
```
```YAML
``` 
</p>
</details>

### Question 6 : Find the name of pod which is using most CPU across all namespaces. Enter the name of pod in /root/high-cpu.yaml.
<details><summary>show</summary>
<p>

```bash
kubectl top pods -A --sort-by=cpu > /root/high-cpu.yaml
//or
kubectl top pod -A | sort --reverse --key 3 --numeric
```
```YAML
``` 
</p>
</details>
 
---

## 5. Pod Design - 20%

### Question 1 : Complete the following tasks.
#### 1. Create a deployment named hoth with image httpd in planets namespace.
#### 2. Scale the deployment to 4 replicas.
#### 3. Update the deployment to use httpd:2.4.46 image.
<details><summary>show</summary>
<p>

```bash
kubectl create ns planets
kubectl -n namespace create deployment hoth --image=httpd --dry-run=client -o yaml > 5.1-deployment.yaml
kubectl -n namespace scale deployment hoth --replicas=4
kubectl -n namespace set image deployment hoth httpd=httpd:2.4.46
```
```YAML
``` 
</p>
</details>

### Question 2 : Complete the following tasks.
#### 1. Deployment yavin is deployed but after an upgrade, new pods are not getting created. Rollback the deployment yavin so they are working again.
#### 2. Export yavin deployment spec in JSON to /root/yavin.json file.
<details><summary>show</summary>
<p>

```bash
kubectl rollout undo deploy yavin
kubectl get deploy yavin -o json > /root/yavin.json
```
```YAML
``` 
</p>
</details>

### Question 3 : Deployment naboo is created. Make sure the replicas autoscale with minimum 2 and maximum 5 when at 80% CPU. Use naboo as the name of HPA resource.
<details><summary>show</summary>
<p>

```bash
kubectl rollout undo deploy yavin
kubectl get deploy yavin -o json > /root/yavin.json
```

```YAML
``` 
 
</p>
</details>

### Question 4 : Create a Cron job bespin that runs every 5 minutes(*/5 * * * *) and runs command date. Use alpine image.
<details><summary>show</summary>
<p>

```bash
kubectl create cj bespin --image=alpine --schedule="*/5 * * * *" --dry-run=client -o yaml > 4.1-job.yaml
```

```YAML
``` 
 
</p>
</details>

### Question 5 : Complete the following tasks.
#### 5.1 Label node node01 with shuttle=true.
#### 5.2 Remove annotation flagship=finalizer form node01.
<details><summary>show</summary>
<p>

```bash
kubectl label node node01 shuttle=true
kubectl annotate node node01 flagship-
```

```YAML
``` 
 
</p>
</details>

### Question 6 : Get the name and image of all pods in skywalker namespace having label jedi=true. Write the output to /root/jedi-true.txt and Output should be in the following format. 

pod-name | image-name
---------| -----------
podname  | image
podname2 | image

<details><summary>show</summary>
<p>

```bash
kubectl -n skywalker get pods -l jedi=true -o jsonpath="{range.items[*]}{.metadata.name},{.spec.containers[0].image}{'\n'}{end}" > /root/jedi-true.txt
```

```YAML
``` 
 
</p>
</details>

---

## 6: Services & Networking - 13%

### Question 1 : Complete the following tasks.1. Create a pod named ig-11 with image nginx and expose its port 80.
<details><summary>show</summary>
<p>
```bash
kubectl run ig-11 --image=nginx --port=80 --expose --dry-run=client -o yaml 
```

```YAML
``` 
</p>
</details>

### Question 2 : Create a service for pod ig-11 on using ClusterIP type service with service name greef. Map service port 8080 to container port 80.
<details><summary>show</summary>
<p>

```bash
kubectl expose pod ig-11 --name=greef --port=8080 --target-port=80 --dry-run=client -o yaml 
```

```YAML
``` 
</p>
</details>

### Question 3 : Deployment cara is created. Expose port 80 of the deployment using NodePort on port 31888. Use cara as service name.
<details><summary>show</summary>
<p>

```bash
kubectl expose deployment cara --type=NodePort --port=80 
kubectl patch service cara --patch '{"spec": {"ports": [{"port": 80,"nodePort": 31888}]}}'
```
```YAML
``` 
</p>
</details>

### Question 4 : Pod and Service geonosis is created for you. Create a network policy geonosis-shield which allows only pods with label access=granted to access the service. Use appropriate labels.
<details><summary>show</summary>
<p>

```bash
kubectl run geonosis --image=nginx --port=80 --labels=sector=arkanis --dry-run=client -o yaml > 6.4.1-geonosis-pod.yaml
kubectl expose pod geonosis --name=geonosis --port=80 --target-port=80 > 6.4.2-geonosis-svc.yaml
kubectl apply -f 6.4.2-geonosis-svc.yaml

cat << EOF > 6.4.3-geonosis-shield.yaml 
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: geonosis-shield
  namespace: default
spec:
  podSelector:
    matchLabels:
      sector: arkanis
  ingress:
  - from:
    - podSelector:
        matchLabels:
          access: granted
          
EOF

kubectl apply -f 6.4.3-geonosis-shield.yaml 

kubectl run busybox --image=busybox --labels=access=granted -it --rm -- wget -O-  10.103.26.211:80
kubectl run busybox --image=busybox --restart=Never -it --rm -- wget -O- 10.152.183.196:8080
```

```YAML
``` 
 
</p>
</details>

---
## 7. State Persistence - 8%

### 1. Create a pod named vader with image nginx. Mount a volume named vader-vol at /var/www/html, which should live as long as pod lives.
<details><summary>show</summary>
<p>

```bash
kubectl run vader --image=nginx --dry-run=client -o yaml > 7.1-vader-pod.yaml
vi 7.1-vader-pod.yaml
kubectl apply -f  7.1-vader-pod.yaml
```

```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: vader
  name: vader
spec:
  containers:
  - image: nginx
    name: vader
    volumeMounts:
      - name: vadel-vol
        mountPath: "/var/www/html"
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  volumes:
    - name: vadel-vol
      emptyDir: {}
status: {}
``` 
 
</p>
</details>

### 2. We created a persistent volume maul-pv and a persistent volume claim maul-pvc. But our PVC is not bounding to PV. Fix the issue. You may need to delete and recreate the PVC.
<details><summary>show</summary>
<p>

```bash
kubectl get pvc maul-pv > maul-pv.yaml
kubectl get pvc maul-pvc > maul-pvc.yaml
vi maul-pvc.yaml

```

```YAML
apiVersion: v1
kind: PersistentVolume
metadata:
  name: maul-pv
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/data"
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: maul-pvc
spec:
  storageClassName: manual
  accessModes:
    # Update This 
    - ReadWriteOnce
    #		
  resources:
    requests:
      storage: 3Gi    
``` 

</p>
</details>


	
### Question 3 : Complete the following tasks.
#### 1. Create a persistent volume sidious-pv with 200Mi at /data/mysql on host. Use manual storageClassName and ReadWriteOnce access mode.
#### 2. Create a persistent volume claim sidious-pvc and consume the pv sidious-pv.
#### 3. Create a pod sidious with image mysql and mount the PVC at /var/lib/mysql using volume name sidious-vol. Set an environment variable MYSQL_ROOT_PASSWORD=my-secret-pw as well.
<details><summary>show</summary>
<p>

```bash
cat << EOF > 7.3.1-sidious-pv.yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: sidious-pv
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 200Mi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/data/mysql"
EOF

kubectl apply -f 7.3.1-sidious-pv.yaml

cat << EOF > 7.3.2-sidious-pvc.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: sidious-pvc
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 200Mi
EOF

kubectl apply -f 7.3.2-sidious-pvc.yaml

cat << EOF > 7.3.3-sidious-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: sidious
spec:
  containers:
    - name: mysql
      image: mysql
      volumeMounts:
        - mountPath: "/var/lib/mysql"
          name: sidious-vol
  volumes:
    - name: sidious-vol
      persistentVolumeClaim:
        claimName: sidious-pvc
EOF

kubectl apply -f 7.3.3-sidious-pod.yaml

```

```YAML
```
 
</p>
</details>

          
### Question 4 : Create a pod dooku with two containers using image redis and nginx. Create a shard hostPath volume at /data/dooku named dooku-logs mounted at /var/log/dooku in both the containers.
<details><summary>show</summary>
<p>

```bash
kubectl run dooku --image=redis --dry-run=client -o yaml > 7.4-dooku-pod.yaml
vi 7.4-dooku-pod.yaml
```

```YAML
apiVersion: v1
kind: Pod
metadata:
  name: dooku
spec:
  containers:
    - name: redis
      image: redis
      volumeMounts:
        - mountPath: "/var/log/dooku"
          name: dooku-logs
    - name: nginx
      image: nginx
      volumeMounts:
        - mountPath: "/var/log/dooku"
          name: dooku-logs
  volumes:
    - name: dooku-logs
      hostPath:
        path:"/data/dooku"
        type: DirectoryOrCreate
``` 

```bash
kubectl apply -f  7.4-dooku-pod.yaml
```
 
</p>
</details>


# CKAD Check List	
- [x] Register for CKAD
- [x] Prepare for CKAD
- [x] this is a complete item
- [ ] this is an incomplete item


# Conclusion !!!
<p>
CKAD is a performance-based exam and it’s all about completing 19 questions within 2 hours. We need a lot of practice for it. These 150 questions give you enough practice for the exam. The more you practice the more comfortable you feel during the exam. Practice. Practice. Practice.
</p>

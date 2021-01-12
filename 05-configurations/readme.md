# Configuration (18%)
1. Practice questions based on these concepts
2. Understand ConfigMaps
3. Understand SecurityContexts
4. Define an application’s resource requirements
5. Create & Consume Secrets
6. Understand ServiceAccounts

## 2. Configuration - 18%

### Question 1 : Create a config map called al-conf in namespace called datatab. Use value al-user=i100121 You may need to create namespace if it does not exists.
<details><summary>show</summary>
<p>

```bash
kubectl create ns datatab
kubectl create -n datatab cm al-conf --from-literal=al-user=i100121 --dry-run=client -o yaml > 2.1-al-conf.yaml
kubactl apply -f 2.1-al-conf.yaml
```
</p>
</details>

### Question 2 : A configmap al-conf has been created in namespace called datatab. Expose the value of al-user to a pod named al-pod as AL_USER environment variable. Use redis image for the pod.
<details><summary>show</summary>
<p>

```bash
kubectl run -n datatab al-pod --image=redis --dry-run=client -o yaml > 2.2-al-pod.yaml
vi 2.2-al-pod.yaml
```

```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: al-pod
  name: al-pod
  namespace: datatab
spec:
  containers:
  - image: redis
    name: al-pod
    # Add Below
    env:
      - name: AL_USER
        valueFrom:
          configMapKeyRef:
            name: my-config
            key: confa
    #				
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```
```bash
kubactl apply -f 2.2-al-pod.yaml
```
</p>
</details>

### Question 3 : Create a Pod named secure-pod. Use redis image. Run pod as user 1000 and group 2000.
<details><summary>show</summary>
<p>

```bash
kubectl run secure-pod --image=redis --dry-run=client -o yaml > 2.3-secure-pod.yaml
vi 2.3-secure-pod.yaml
```
```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: secure-pod
  name: secure-pod
spec:
  # Add Below
  securtyContext:
    runAsUser: 1000
    runAsGroup: 2000
  #
  containers:
  - image: redis
    name: redis
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```

kubactl apply -f 2.3-secure-pod.yaml

</p>
</details>

### Question 4 : Create a pod manifest file at /root/limited-pod.yaml with name limited-pod and busybox image. Set memory request at 100Mi and limit at 200Mi. You do not need to create the pod.
<details><summary>show</summary>
<p>
 
```bash
kubectl run limited-pod --image=busybox --requests="memory=100Mi" --limits="200Mi" --dry-run=client -o yaml > /root/limited-pod.yaml
``` 

</p>
</details>

### Question 5 : Complete the following tasks.
#### 5.1 Create a secret db-secret with value MYSQL_ROOT_PASSWORD=YoYoSecret and MYSQL_PASSWORD=XoXoPassword.
#### 5.2 Create a configmap db-config with value MYSQL_USER=k8s and MYSQL_DATABASE=newdb.
#### 5.1 Create a pod named mydb with image mysql:5.7 and expose all values of db-secret and db-config as environment variable to pod.
<details><summary>show</summary>
<p>

```bash
kubectl create cm db-config --from-literals=MYSQL_USER=k8s --from-literals=MYSQL_DATABASE=newdb --dry-run=client -o yaml > 2.5.1-db-config.yaml
kubactl apply -f 2.5.1-db-config.yaml

kubectl create secret generic db-secret --from-literals=MYSQL_ROOT_PASSWORD=YoYoSecret --from-literals=MYSQL_PASSWORD=XoXoPassword --dry-run=client -o yaml > 2.5.2-db-secret.yaml
kubactl apply -f 2.5.2-db-secret.yaml

kubectl run mydb --image=mysql:5.7 --dry-run=client -o yaml > 2.5.3-mydb.yaml
vi 2.5.3-mydb.yaml
```

```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: secure-pod
  name: secure-pod
spec:
  # Add Below
  securtyContext:
    runAsUser: 1000
    runAsGroup: 2000
  #
  containers:
  - image: redis
    name: redis
    resources: {}
    # Add Below
    envFrom:
    - configMapRef:
      name: db-config
    - secretRef:
      name: db-secret
    #
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
``` 
</p>
</details>

### Question 6 : Complete the following tasks.
#### 6.1 Create a service account named namaste
#### 6.2 Use the service account to create a yo-namaste pod with nginx image.
<details><summary>show</summary>
<p>

```bash
kubectl create sa namaste --dry-run=client -o yaml > 2.6.1-sa.yaml
kubactl apply -f 2.6.1-sa.yaml

kubectl run pod yo-namaste --image=nginx --serviceaccount=namaste --dry-run=client -o yaml > 2.6.2-sa-pod.yaml 
kubactl apply -f 2.6.2-sa-pod.yaml
```
 
</p>
</details>


### Question 7 : for pod secure-pod as above(Q-3), this time set the securityContext for the container as well and verify that the securityContext of container overrides the Pod level securityContext.
<details><summary>show</summary>
<p>

```bash
// create yml file with dry-run
kubectl run secbusybox --image=busybox --restart=Never --dry-run -o yaml -- /bin/sh -c "sleep 3600;" > busybox.yml

// edit the pod like below and create
kubectl create -f busybox.yml

// verify
kubectl exec -it secbusybox -- sh
id // you can see container securityContext overides the Pod level
```

```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: secbusybox
  name: secbusybox
spec:
  securityContext:
    runAsUser: 1000
  containers:
  - args:
    - /bin/sh
    - -c
    - sleep 3600;
    image: busybox
    securityContext:
      runAsUser: 2000
    name: secbusybox
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Never
status: {}
```
 
</p>
</details>
- - -
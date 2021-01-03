# CKAD Certification 
*A Complete Guide for CKAD Certification*

## 1. Concepts - 13%

### Question 1 : Create a namespace called "frontend".

<details><summary>show</summary>
<p>

```bash
kubectl create ns frontend --dry-run=client -o yaml > 1.1-ns.yaml
kubectl apply -f 1.1-namespace.yaml
```

```YAML
apiVersion: v1
kind: Namespace
metadata:
  creationTimestamp: null
  name: frontend
spec: {}
status: {}
```
</p>
</details>

### Question 2 : Create a Pod named nginx in frontend namespace. Use nginx image.
<details><summary>show</summary>
<p>

```bash
kubectl -n frontend run nginx --image=nginx --dry-run=client -o yaml > 1.2-pod.yaml 
kubectl -n frontend apply -f 1.2-pod.yaml
```

```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
  namespace: frontend
spec:
  containers:
  - image: nginx
    name: nginx
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```
</p>
</details>

 
### Question 3 : Get list of all pods in kube-system namespace and write the output to /root/kube-system-pods.txt file.
<details><summary>show</summary>
<p>

```bash
kubectl get pods -n kube-system > /root/kube-system-pods.txt
```

</p>
</details>

### Question 4 : Get the list of all services across all namespaces and write the output to /root/all-services.txt file.
<details><summary>show</summary>
<p>

```bash
kubectl get svc -A > /root/all-services.txt
```

</p>
</details>

### Question 5 : Create a pod named hello with image busybox and command echo "Hello World". Make sure the pod do not restart automatically.
<details><summary>show</summary>
<p>

```bash
 kubectl run hello --image=busybox --restart=Never --dry-run=client -o yaml -- echo "Hello World" > 1.5-pod.yaml 
 kubectl apply -f 1.5-pod.yaml
```

</p>
</details>

### Question 6 : Generate a pod manifest file at /root/mypodx.yaml. Pod name should be mypodx with image redis. Make sure you only generate the pod manifest file, you do not have to crete the pod.
<details><summary>show</summary>
<p>

```bash
kubectl run mypodx --image=redis --restart=Never --dry-run=client -o yaml > /root/mypodx.yaml
```

</p>
</details>




## 2. Configuration - 18%

### Question 1 : Create a config map called al-conf in namespace called datatab. Use value al-user=i100121 You may need to create namespace if it does not exists.
<details><summary>show</summary>
<p>

```bash
kubectl create ns datatab
kubectl create -n datatab cm al-conf --from-literal=al-user=i100121 --dry-run=client -o yaml > 2.1-cm.yaml
kubactl apply -f 2.1-cm.yaml
```

</p>
</details>


### Question 2 : A configmap al-conf has been created in namespace called datatab. Expose the value of al-user to a pod named al-pod as AL_USER environment variable. Use redis image for the pod.
<details><summary>show</summary>
<p>

```bash
kubectl run -n datatab al-pod --image=redis --dry-run=client -o yaml > 2.2-al-pod.yaml

```

vi 2.2-al-pod.yaml

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

kubactl apply -f 2.2-al-pod.yaml

</p>
</details>

### Question 3 : Create a Pod named secure-pod. Use redis image. Run pod as user 1000 and group 2000.
<details><summary>show</summary>
<p>

```bash
kubectl run secure-pod --image=redis --dry-run=client -o yaml > 2.3-secure-pod.yaml
```

vi 2.3-secure-pod.yaml

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

</p>
</details>

---

## 3. Multi-Container Pods - 10%


## 4. Observability - 18%


## 5. Pod Design - 20%


## 6: Services & Networking - 13%


## 7. State Persistence - 8%

*This text will be italic*
_This will also be italic_

**This text will be bold**
__This will also be bold__

_You **can** combine them_

# List 
* Item 1
* Item 2
  * Item 2a
  * Item 2b

# Links	
http://github.com - automatic!
[GitHub](http://github.com)
	
# Task List	
- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
- [x] list syntax required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item

# Tables 
First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column

## Strikethrough
Any word wrapped with two tildes (like ~~this~~) will appear crossed out.
	
## Emoji-cheat-sheet
https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md
	






## Generate SSH Key
ssh-keygen -t rsa -b 4096 -C "brijeshdhaker@gmail.com"

##

##
…or create a new repository on the command line
echo "# personal" >> README.md

git init

git add README.md

git commit -m "first commit"

git branch -M develop

git remote add origin git@github.com:brijeshdhaker/ckad-exam.git

git push -u origin develop
                

…or push an existing repository from the command line

git remote add origin git@github.com:brijeshdhaker/ckad-exam.git

git branch -M master

git push -u origin master
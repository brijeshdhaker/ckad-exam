# CKAD Certification 
*A Complete Guide for CKAD Certification *

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
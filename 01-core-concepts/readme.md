## 1. Concepts - 13%

1. Understand Kubernetes API Primitives
2. Create and Configure Basic Pods

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
kubectl -n frontend run nginx --image=nginx --dry-run=client -o yaml > 1.2-nginx-pod.yaml 
kubectl -n frontend apply -f 1.2-nginx-pod.yaml
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
 kubectl run hello --image=busybox --restart=Never --dry-run=client -o yaml -- echo "Hello World" > 1.5-hello-pod.yaml 
 kubectl apply -f 1.5-hello-pod.yaml
```
</p>
</details>

### Question 6 : Generate a pod manifest file at /root/mypodx.yaml. Pod name should be mypodx with image redis. Make sure you only generate the pod manifest file, you do not have to create the pod.
<details><summary>show</summary>
<p>

```bash
kubectl run mypodx --image=redis --restart=Never --dry-run=client -o yaml > /root/mypodx.yaml
```
</p>
</details>

---

kubectl get pods -o custom-columns=NAME:.metadata.name

# Get all running pods in the namespace
kubectl get pods --field-selector=status.phase=Running

# List Events sorted by timestamp
kubectl get events --sort-by=.metadata.creationTimestamp


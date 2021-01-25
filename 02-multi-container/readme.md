## 3. Multi-Container Pods - 10%
1. Understand multi-container pod design patterns (eg: ambassador, adaptor, sidecar)


### Question 1 : Create a pod mp-hello with image alpine,nginx and consul:1.8. Use command sleep infinity for alpine container.
<details><summary>show</summary>
<p>

```bash
kubectl run mp-hello --image=nginx --dry-run=client -o yaml > 3.1.1-mp-hello.yaml 
vi 3.1.1-mp-hello.yaml
```

```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: mp-hello
  name: mp-hello
spec:
  containers:
  - image: nginx
    name: nginx 
    resources: {}
  - image: busybox
    name: busybox
    args:
    - /bin/sh
    - -c    
    - sleep 1000
    resources: {}
  - image: consul:1.8
    name: consul
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
``` 

</p>
</details>

---

### Question 2 : Create pod with nginx container exposed at port 80. Add a busybox init container which downloads a page using "wget -O /work-dir/index.html http://neverssl.com/online". Make a volume of type emptyDir and mount it in both containers. For the nginx container, mount it on "/usr/share/nginx/html" and for the initcontainer, mount it on "/work-dir". When done, get the IP of the created pod and create a busybox pod and run "wget -O- IP"
<details><summary>show</summary>
<p>

```bash
kubectl run web-pod --image=nginx --port=80 --dry-run=client -o yaml > 3.1.1-mp-hello.yaml 
vi 3.1.1-mp-hello.yaml
```

```YAML
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: box
  name: box
spec:
  initContainers: #
  - args: #
    - /bin/sh #
    - -c #
    - wget -O /work-dir/index.html http://neverssl.com/online #
    image: busybox #
    name: box #
    volumeMounts: #
    - name: vol #
      mountPath: /work-dir #
  containers:
  - image: nginx
    name: nginx
    ports:
    - containerPort: 80
    volumeMounts: #
    - name: vol #
      mountPath: /usr/share/nginx/html #
  volumes: #
  - name: vol #
    emptyDir: {} #
``` 

</p>
</details>

---
### Question 3 : Create busybox pod with two containers, each one will have the image busybox and will run the 'sleep 3600' command. Make both containers mount an emptyDir at '/etc/foo'. Connect to the second busybox, write the first column of '/etc/passwd' file to '/etc/foo/passwd' using command 'cat /etc/passwd | cut -f 1 -d ':' > /etc/foo/passwd '. Connect to the first busybox and write '/etc/foo/passwd' file to standard output. Delete pod.
<details><summary>show</summary>
<p>

```bash
kubectl run web-pod --image=nginx --port=80 --dry-run=client -o yaml > 3.1.1-mp-hello.yaml 
vi 3.1.1-mp-hello.yaml
```

```YAML
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: busybox
  name: busybox
spec:
  dnsPolicy: ClusterFirst
  restartPolicy: Never
  containers:
  - args:
    - /bin/sh
    - -c
    - sleep 3600
    image: busybox
    imagePullPolicy: IfNotPresent
    name: c1
    resources: {}
    volumeMounts: #
    - name: myvolume #
      mountPath: /etc/foo #
  - args:
    - /bin/sh
    - -c
    - sleep 3600
    image: busybox
    name: c2 
    volumeMounts: 
    - name: myvolume 
      mountPath: /etc/foo 
  volumes: 
  - name: myvolume 
    emptyDir: {} 
``` 

</p>
</details>

---

apiVersion: v1
kind: Pod
metadata:
  name: init-demo
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
    volumeMounts:
    - name: workdir
      mountPath: /usr/share/nginx/html
# These containers are run during pod initialization
  initContainers:
  - name: install
    image: busybox
    command: ["/bin/sh", "-c"]
    args: ['wget -O /work-dir/index.html http://$(HTTP_SERVER_SERVICE_HOST):$(HTTP_SERVER_SERVICE_PORT)']
    volumeMounts:
    - name: workdir
      mountPath: "/work-dir"
  dnsPolicy: Default
  volumes:
  - name: workdir
    emptyDir: {}

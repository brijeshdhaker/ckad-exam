# Observability (18%)
1. Practice questions based on these concepts
2. Understand LivenessProbes and ReadinessProbes
3. Understand Container Logging
4. Understand how to monitor applications in kubernetes
5. Understand Debugging in Kubernetes


## Question 1
Create a namespace called ggckad-s1 in your cluster.

Run the following pods in this namespace:

A pod called pod-a with a single container running the kubegoldenguide/simple-http-server image
A pod called pod-b that has one container running the kubegoldenguide/alpine-spin:1.0.0 image, and one container running nginx:1.7.9
Write down the output of kubectl get pods for the ggckad-s1 namespace.

```bash
kubectl create ns ggckad-s1
kubectl config set-context --current --namespace=ggckad-s1

```

---
## Question 2
All operations in this question should be performed in the ggckad-s2 namespace.

Create a ConfigMap called app-config that contains the following two entries:

connection_string set to localhost:4096
external_url set to google.com
Run a pod called q-two-pod with a single container running the kubegoldenguide/alpine-spin:1.0.0 image, and expose these configuration settings as environment variables inside the container.

---
## Question 3
All operations in this question should be performed in the ggckad-s3 namespace.
kubectl config set-context --current --namespace=ggckad-s3

Create a pod q-three-pod that has two containers. Both containers should run the kubegoldenguide/alpine-spin:1.0.0 image. The first container should run as user ID 1000, and the second container with user ID 2000. Both containers should use file system group ID 3000.

---
## Question 4
All operations in this question should be performed in the ggckad-s4 namespace.

This question will require you to create a pod that runs the image k8s.gcr.io/liveness. This image is in the main Docker repository at hub.docker.com.

This image is a web server that has a health endpoint served at /healthz port 8080 that returns a 200 status code response when the application is healthy. The application typically takes sixty seconds to start. 
Create a pod called q-four-pod to run this application, making sure to define liveness and readiness probes that use this health endpoint.

```
apiVersion: v1
kind: Pod
metadata:
  labels:
    test: liveness
  name: liveness-http
spec:
  containers:
  - name: liveness
    image: k8s.gcr.io/liveness
    args:
    - /server
    livenessProbe:
      httpGet:
        path: /healthz
        port: 8080
        httpHeaders:
        - name: Custom-Header
          value: Awesome
      initialDelaySeconds: 3
      periodSeconds: 3
```

---
## Question 5
All operations in this question should be performed in the ggckad-s5 namespace.

Create a file called question-5.yaml that declares a deployment in the ggckad-s5 namespace, with six replicas running the nginx:1.7.9 image.

Each pod should have the label app=revproxy. The deployment should have the label client=user. Configure the deployment so that when the deployment is updated, the existing pods are killed off before new pods are created to replace them.

```YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: question-5
    client: user
  name: question-5
  namespace: ggckad-s5
spec:
  replicas: 6
  selector:
    matchLabels:
      run: question-5
  strategy: 
    type: Recreate
  template:
    metadata:
      creationTimestamp: null
      labels:
        run:  question-5
        app: revproxy
    spec:
      containers:
      - image: nginx:1.7.9
        name: nginx
        resources: {}
status: {}
```

### Get the memory and CPU usage of all the pods and find out top 3 pods which have the highest usage and put them into the cpu-usage.txt file
// get the top 3 hungry pods
kubectl top pod --all-namespaces | sort --reverse --key 3 --numeric | head -3

// putting into file
kubectl top pod --all-namespaces | sort --reverse --key 3 --numeric | head -3 > cpu-usage.txt

// verify
cat cpu-usage.txt


kubectl top pod --all-namespaces --sort-by=cpu --no-headers
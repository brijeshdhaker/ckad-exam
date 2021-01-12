# Services and Networking (13%)
Practice questions based on these concepts
1. Understand Services
2. Demonstrate a basic understanding of NetworkPolicies


apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: access-nginx
spec:
  podSelector:
    matchLabels:
      app: nginx
  ingress:
  - from:
    - podSelector:
        matchLabels:
          access: "true"

#
#
#

cat << EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
  creationTimestamp: null
  name: hello-job
spec:
  completions: 5            # Run 10 times    
  parallelism: 5            # Run in parallelism
  activeDeadlineSeconds: 30  # it will be automatically terminated by kubernetes if it takes more than 30 seconds to execute
  template:
    metadata:
      creationTimestamp: null
    spec:
      containers:
      - command:
        - /bin/sh
        - -c
        args: ["date; echo 'Hello from k8s job' ..."]
        image: busybox
        name: hello-job
        resources: {}
      restartPolicy: Never
status: {}

EOF

#
# kubectl create job hello-job --image=busybox --dry-run=client -o yaml -- echo "Hello I am from job" > hello-job.yaml
# 

#
# kubectl create job job-pi --image=perl --dry-run=client -o yaml -- echo "perl -Mbignum=bpi -wle 'print bpi(2000)'" > job-pi.yaml
#

#
# kubectl create job job-pi --image=perl --dry-run=client -o yaml -- echo "perl -Mbignum=bpi -wle 'print bpi(2000)'" > job-pi.yaml
#

# kubectl patch cj hello-job --type='json' -p='[{"op": "add", "path": "/spec/parallelism", "value":17}]'
# kubectl patch cj hello-job --type='json' -p='[{"op": "replace", "path": "/spec/completions", "value":10}]'
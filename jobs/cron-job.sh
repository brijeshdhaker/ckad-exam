cat << EOF | kubectl apply -f -
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  creationTimestamp: null
  name: date-job
spec:
  startingDeadlineSeconds: 30
  jobTemplate:
    metadata:
      creationTimestamp: null
      name: date-job
    spec:
      template:
        metadata:
          creationTimestamp: null
        spec:
          containers:
          - command:
            - bin/sh
            - -c
            - date; echo Hello from kubernetes cluster
            image: busybox
            name: date-job
            resources: {}
          restartPolicy: OnFailure
  schedule: '*/1 * * * *'
status: {}
EOF

#
# kubectl create cronjob cron-job --image=busybox --schedule="*/1 * * * *" --dry-run=client -o yaml -- bin/sh -c "date; echo Hello from kubernetes cluster" > cron-job.yaml
#

# Update a container's image using a json patch with positional arrays

# kubectl patch cj cron-job --type='json' -p='[{"op": "add", "path": "/spec/startingDeadlineSeconds", "value":17}]'
# kubectl patch cj cron-job --type='json' -p='[{"op": "replace", "path": "/spec/startingDeadlineSeconds", "value":20}]'
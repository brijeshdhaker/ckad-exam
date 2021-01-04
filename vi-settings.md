### Kubectl Alias
alias k='kubectl'
alias kd='kubectl describe'
alias kr='kubectl run'
alias kc='kubectl create'
alias ka='kubectl apply'
alias ke='kubectl explain'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployment'

### VI Editor Settings
set tabsize 2
set tabstospaces
set autoindent

### Other Settings
export do="--dry-run=client -o yaml"
source <(kubectl completion bash)
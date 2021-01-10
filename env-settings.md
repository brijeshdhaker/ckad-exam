टट







स



### VI Editor (~/.vimrc) Settings
set ts=2                # To control the number of space characters that will be inserted when the tab key is pressed
set sts=2               # To cause <Tab> and <BS> to insert and delete the correct number of spaces 
set sw=2                # To change the number of space characters inserted for indentation
set expandtab           # To insert space characters whenever the tab key is pressed
set autoindent          # To automatically indent lines using the vi editor

## Proposed Setting 
set expandtab
set tabstop=2
set shiftwidth=2
set sts=2
set autoindent
set smartindent
set bg=dark
set nowrap
set paste



##
kubectl config current-context
kubectl config set-context --current --namespace=107424-spark-cluster-dev

kubectl delete pod my-pod --grace-period=0 --force
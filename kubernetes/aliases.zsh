# Kubernetes aliases
alias k='kubectl'
alias kc='kubectl'

# Get commands
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgd='kubectl get deployments'
alias kgs='kubectl get services'
alias kgn='kubectl get nodes'
alias kgns='kubectl get namespaces'
alias kgi='kubectl get ingress'
alias kgc='kubectl get configmaps'
alias kgsec='kubectl get secrets'
alias kgpvc='kubectl get pvc'
alias kga='kubectl get all'

# Get with wide output
alias kgpw='kubectl get pods -o wide'
alias kgdw='kubectl get deployments -o wide'
alias kgsw='kubectl get services -o wide'
alias kgnw='kubectl get nodes -o wide'

# Describe commands
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kdd='kubectl describe deployment'
alias kds='kubectl describe service'
alias kdn='kubectl describe node'
alias kdi='kubectl describe ingress'

# Delete commands
alias kdel='kubectl delete'
alias kdelp='kubectl delete pod'
alias kdeld='kubectl delete deployment'
alias kdels='kubectl delete service'

# Logs
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias klp='kubectl logs -p'

# Exec
alias kex='kubectl exec -it'
alias keti='kubectl exec -ti'

# Apply and create
alias ka='kubectl apply -f'
alias kcreate='kubectl create'
alias krun='kubectl run'

# Edit
alias ke='kubectl edit'
alias kep='kubectl edit pod'
alias ked='kubectl edit deployment'
alias kes='kubectl edit service'

# Port forward
alias kpf='kubectl port-forward'

# Scale
alias kscale='kubectl scale'

# Namespace
alias kn='kubectl config set-context --current --namespace'
alias kns='kubectl config view --minify --output "jsonpath={..namespace}"'

# Context
alias kctx='kubectl config current-context'
alias kcon='kubectl config use-context'

# Top (metrics)
alias ktop='kubectl top'
alias ktopn='kubectl top nodes'
alias ktopp='kubectl top pods'

# Rollout
alias kro='kubectl rollout'
alias kros='kubectl rollout status'
alias krou='kubectl rollout undo'
alias kroh='kubectl rollout history'
alias kror='kubectl rollout restart'

# All namespaces
alias kgpa='kubectl get pods --all-namespaces'
alias kgpwa='kubectl get pods --all-namespaces -o wide'
alias kgaa='kubectl get all --all-namespaces'

# Watch
alias kgpw='kubectl get pods -w'
alias watch-pods='watch kubectl get pods'

# Config
alias kconf='kubectl config'
alias kconfg='kubectl config get-contexts'
alias kconfu='kubectl config use-context'


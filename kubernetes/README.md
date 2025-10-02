# Kubernetes Module

Kubernetes (kubectl) aliases, helper functions, and shell completions for efficient cluster management.

## What's Included

### Aliases (`aliases.zsh`)

#### Basic Commands
```bash
k           # kubectl
kc          # kubectl
```

#### Get Resources
```bash
kg          # kubectl get
kgp         # kubectl get pods
kgd         # kubectl get deployments
kgs         # kubectl get services
kgn         # kubectl get nodes
kgns        # kubectl get namespaces
kgi         # kubectl get ingress
kgc         # kubectl get configmaps
kgsec       # kubectl get secrets
kgpvc       # kubectl get pvc (persistent volume claims)
kga         # kubectl get all
```

#### Get with Wide Output
```bash
kgpw        # kubectl get pods -o wide
kgdw        # kubectl get deployments -o wide
kgsw        # kubectl get services -o wide
kgnw        # kubectl get nodes -o wide
```

#### Describe Resources
```bash
kd          # kubectl describe
kdp         # kubectl describe pod
kdd         # kubectl describe deployment
kds         # kubectl describe service
kdn         # kubectl describe node
kdi         # kubectl describe ingress
```

#### Delete Resources
```bash
kdel        # kubectl delete
kdelp       # kubectl delete pod
kdeld       # kubectl delete deployment
kdels       # kubectl delete service
```

#### Logs
```bash
kl          # kubectl logs
klf         # kubectl logs -f (follow)
klp         # kubectl logs -p (previous)
```

#### Execute Commands in Pods
```bash
kex         # kubectl exec -it
keti        # kubectl exec -ti
```

#### Apply and Create
```bash
ka          # kubectl apply -f
kcreate     # kubectl create
krun        # kubectl run
```

#### Edit Resources
```bash
ke          # kubectl edit
kep         # kubectl edit pod
ked         # kubectl edit deployment
kes         # kubectl edit service
```

#### Port Forwarding
```bash
kpf         # kubectl port-forward
```

#### Scale Resources
```bash
kscale      # kubectl scale
```

#### Namespace Management
```bash
kn          # kubectl config set-context --current --namespace
kns         # Show current namespace
```

#### Context Management
```bash
kctx        # kubectl config current-context
kcon        # kubectl config use-context
kconf       # kubectl config
kconfg      # kubectl config get-contexts
kconfu      # kubectl config use-context
```

#### Resource Metrics (requires metrics-server)
```bash
ktop        # kubectl top
ktopn       # kubectl top nodes
ktopp       # kubectl top pods
```

#### Rollout Management
```bash
kro         # kubectl rollout
kros        # kubectl rollout status
krou        # kubectl rollout undo
kroh        # kubectl rollout history
kror        # kubectl rollout restart
```

#### All Namespaces
```bash
kgpa        # kubectl get pods --all-namespaces
kgpwa       # kubectl get pods --all-namespaces -o wide
kgaa        # kubectl get all --all-namespaces
```

#### Watch Resources
```bash
kgpw        # kubectl get pods -w
watch-pods  # watch kubectl get pods
```

### Functions (`env.zsh`)

#### `kctxswitch [context]`
Switch between kubectl contexts easily:

```bash
# Show current context and list all available
kctxswitch

# Switch to a specific context
kctxswitch minikube
kctxswitch production-cluster
```

#### `knsswitch [namespace]`
Switch between namespaces in current context:

```bash
# Show current namespace and list all available
knsswitch

# Switch to a specific namespace
knsswitch production
knsswitch kube-system
knsswitch default
```

#### `kpod [pattern]`
Find pods by partial name:

```bash
# List all pods
kpod

# Find pods matching pattern
kpod nginx
kpod api
```

#### `klogs <pattern> [-f]`
Get logs from first matching pod:

```bash
# Get logs from pod matching pattern
klogs nginx

# Follow logs from pod matching pattern
klogs api -f
```

#### `kexec <pattern> [command]`
Execute into first matching pod:

```bash
# Exec with /bin/sh (default)
kexec nginx

# Exec with specific command
kexec api /bin/bash
kexec postgres psql
```

#### `kinfo`
Show current cluster information:

```bash
kinfo
# Output:
# Context: production
# Namespace: default
# Server: https://...
# Nodes: 3
# Pods: 47
# Deployments: 15
# Services: 20
```

#### `krestart <deployment>`
Restart a deployment and wait for rollout:

```bash
krestart api-deployment
krestart nginx
```

### Environment Variables (`env.zsh`)

- **`KUBE_EDITOR`** - Editor for `kubectl edit` (defaults to `$EDITOR` or `vim`)

### Shell Completion (`completion.zsh`)

Auto-completion for all kubectl commands, resource types, and names. Also works with the `k` alias.

## Usage Examples

### Quick Start
```bash
# Check cluster info
kinfo

# List all pods
kgp

# Get logs from a pod
klogs api-pod -f
```

### Working with Contexts and Namespaces
```bash
# Show current context
kctxswitch

# Switch context
kctxswitch staging

# Show current namespace
knsswitch

# Switch namespace
knsswitch production
```

### Pod Management
```bash
# List pods in current namespace
kgp

# List pods in all namespaces
kgpa

# Get detailed pod info
kgpw

# Describe a specific pod
kdp my-pod-name

# Get logs
klogs my-app -f

# Execute into pod
kexec my-app /bin/bash
```

### Deployment Management
```bash
# List deployments
kgd

# Describe a deployment
kdd my-deployment

# Edit a deployment
ked my-deployment

# Scale a deployment
kscale deployment my-deployment --replicas=3

# Restart a deployment
krestart my-deployment

# Rollout status
kros deployment my-deployment

# Rollout history
kroh deployment my-deployment

# Rollback
krou deployment my-deployment
```

### Service Management
```bash
# List services
kgs

# Describe a service
kds my-service

# Port forward to a service
kpf service/my-service 8080:80

# Or to a pod
kpf pod/my-pod 8080:80
```

### Apply Configuration
```bash
# Apply a manifest
ka deployment.yaml

# Apply all manifests in directory
ka ./manifests/

# Apply from URL
ka https://example.com/manifest.yaml
```

### Resource Monitoring
```bash
# Watch pods
kgpw

# Or use watch
watch-pods

# Check resource usage
ktopn    # Node metrics
ktopp    # Pod metrics
```

### ConfigMaps and Secrets
```bash
# List configmaps
kgc

# Get a specific configmap
kg configmap my-config -o yaml

# List secrets
kgsec

# Get a secret
kg secret my-secret -o yaml
```

### Debugging
```bash
# Get pod logs
klf my-pod

# Get previous pod logs (after crash)
klp my-pod

# Exec into pod
kexec my-pod /bin/bash

# Port forward for local testing
kpf pod/my-pod 8080:80
# Now access at localhost:8080

# Get events
kg events --sort-by='.lastTimestamp'

# Describe pod to see events
kdp my-pod
```

## Installation

The module is automatically loaded when you source your `.zshrc`. To install kubectl and related tools:

```bash
brew install kubectl
brew install kubectx  # Optional: context/namespace switcher
brew install k9s      # Optional: terminal UI for k8s
brew install helm     # Optional: Kubernetes package manager
```

Or if you've already updated the Brewfile:

```bash
cd ~/.dotfiles
brew bundle
```

## Configuration

### Set up kubeconfig

Your kubeconfig is typically at `~/.kube/config`. To add a cluster:

```bash
# From cloud provider
aws eks update-kubeconfig --name my-cluster --region us-west-2
gcloud container clusters get-credentials my-cluster
az aks get-credentials --resource-group myRG --name myCluster

# Or manually
kubectl config set-cluster my-cluster --server=https://...
kubectl config set-credentials my-user --token=...
kubectl config set-context my-context --cluster=my-cluster --user=my-user
kubectl config use-context my-context
```

### Multiple Clusters

Manage multiple clusters easily:

```bash
# List all contexts
kconfg

# Switch between contexts
kctxswitch production
kctxswitch staging
kctxswitch development

# Check current context
kctx
```

### Set Default Namespace

```bash
# Set namespace for current context
kn production

# Or use the function
knsswitch production
```

## Customization

### Change Default Editor

Add to `~/.localrc`:

```bash
export KUBE_EDITOR="code --wait"  # VS Code
export KUBE_EDITOR="nano"         # Nano
export KUBE_EDITOR="vim"          # Vim (default)
```

### Add Custom Aliases

Edit `kubernetes/aliases.zsh`:

```bash
alias kgprod='kubectl get pods -n production'
alias kgstage='kubectl get pods -n staging'
```

### Add Custom Functions

Edit `kubernetes/env.zsh`:

```bash
function kdrain() {
  kubectl drain "$1" --ignore-daemonsets --delete-emptydir-data
}
```

## Tips & Best Practices

1. **Always verify context** with `kctx` before making changes
2. **Use namespaces** to organize resources
3. **Watch resources** during deployments with `-w` flag
4. **Use labels** for better resource organization
5. **Check events** when debugging with `kg events`
6. **Use dry-run** for testing: `k apply -f manifest.yaml --dry-run=client`
7. **Resource limits** - always set requests and limits
8. **Health checks** - configure liveness and readiness probes

## Common Workflows

### Deploy an Application
```bash
# Create namespace
k create namespace myapp

# Switch to namespace
knsswitch myapp

# Apply manifests
ka deployment.yaml
ka service.yaml

# Check status
kgp
kgs

# Watch rollout
kros deployment myapp
```

### Debug a Failing Pod
```bash
# Find the pod
kpod myapp

# Check pod details
kdp myapp-pod-xxx

# Check logs
klogs myapp -f

# Exec into pod
kexec myapp /bin/bash

# Check events
kg events --field-selector involvedObject.name=myapp-pod-xxx
```

### Update a Deployment
```bash
# Edit deployment
ked myapp

# Or update image
k set image deployment/myapp myapp=myapp:v2

# Watch rollout
kros deployment myapp

# Check history
kroh deployment myapp

# Rollback if needed
krou deployment myapp
```

## Recommended Tools

- **[kubectx/kubens](https://github.com/ahmetb/kubectx)** - Fast context/namespace switching
- **[k9s](https://k9scli.io/)** - Terminal UI for Kubernetes
- **[helm](https://helm.sh/)** - Package manager for Kubernetes
- **[kustomize](https://kustomize.io/)** - Template-free YAML configuration
- **[stern](https://github.com/stern/stern)** - Multi-pod log tailing
- **[lens](https://k8slens.dev/)** - Kubernetes IDE

## Troubleshooting

### Completion not working
Ensure kubectl is installed and accessible:
```bash
which kubectl
kubectl version --client
```

Reload shell:
```bash
source ~/.zshrc
```

### Can't connect to cluster
Check kubeconfig:
```bash
kubectl config view
kubectl cluster-info
```

Verify credentials:
```bash
kubectl auth can-i get pods
```

### Context not found
List available contexts:
```bash
kubectl config get-contexts
```

## Learn More

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [kubectl Reference](https://kubernetes.io/docs/reference/kubectl/)
- [Kubernetes Best Practices](https://kubernetes.io/docs/concepts/configuration/overview/)


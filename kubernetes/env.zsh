# Kubernetes environment configuration

# Set default editor for kubectl edit (falls back to $EDITOR or vim)
export KUBE_EDITOR="${KUBE_EDITOR:-${EDITOR:-vim}}"

# Function to quickly switch between kubectl contexts
function kctxswitch() {
  if [ -z "$1" ]; then
    echo "Current context: $(kubectl config current-context 2>/dev/null || echo 'none')"
    echo "\nAvailable contexts:"
    kubectl config get-contexts -o name | sed 's/^/  - /'
  else
    kubectl config use-context "$1"
    echo "Switched to context: $1"
    echo "Current namespace: $(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null || echo 'default')"
  fi
}

# Function to quickly switch namespaces
function knsswitch() {
  if [ -z "$1" ]; then
    echo "Current namespace: $(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null || echo 'default')"
    echo "\nAvailable namespaces:"
    kubectl get namespaces -o name 2>/dev/null | sed 's/namespace\///' | sed 's/^/  - /'
  else
    kubectl config set-context --current --namespace="$1"
    echo "Switched to namespace: $1"
  fi
}

# Function to get pod by partial name
function kpod() {
  if [ -z "$1" ]; then
    kubectl get pods
  else
    kubectl get pods | grep -i "$1"
  fi
}

# Function to quickly get logs from first matching pod
function klogs() {
  if [ -z "$1" ]; then
    echo "Usage: klogs <pod-name-pattern> [-f]"
    return 1
  fi
  
  local pod_pattern="$1"
  local follow_flag=""
  
  if [ "$2" = "-f" ]; then
    follow_flag="-f"
  fi
  
  local pod=$(kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep -i "$pod_pattern" | head -1)
  
  if [ -z "$pod" ]; then
    echo "No pod found matching: $pod_pattern"
    return 1
  fi
  
  echo "Getting logs from pod: $pod"
  kubectl logs $follow_flag "$pod"
}

# Function to exec into first matching pod
function kexec() {
  if [ -z "$1" ]; then
    echo "Usage: kexec <pod-name-pattern> [command]"
    return 1
  fi
  
  local pod_pattern="$1"
  local command="${2:-/bin/sh}"
  
  local pod=$(kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep -i "$pod_pattern" | head -1)
  
  if [ -z "$pod" ]; then
    echo "No pod found matching: $pod_pattern"
    return 1
  fi
  
  echo "Executing into pod: $pod"
  kubectl exec -it "$pod" -- "$command"
}

# Function to show current k8s info
function kinfo() {
  echo "Kubernetes Cluster Info"
  echo "======================="
  echo "Context: $(kubectl config current-context 2>/dev/null || echo 'none')"
  echo "Namespace: $(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null || echo 'default')"
  echo "Server: $(kubectl config view --minify --output 'jsonpath={.clusters[0].cluster.server}' 2>/dev/null || echo 'unknown')"
  echo ""
  echo "Cluster Resources:"
  kubectl get nodes --no-headers 2>/dev/null | wc -l | xargs -I {} echo "  Nodes: {}"
  kubectl get pods --all-namespaces --no-headers 2>/dev/null | wc -l | xargs -I {} echo "  Pods: {}"
  kubectl get deployments --all-namespaces --no-headers 2>/dev/null | wc -l | xargs -I {} echo "  Deployments: {}"
  kubectl get services --all-namespaces --no-headers 2>/dev/null | wc -l | xargs -I {} echo "  Services: {}"
}

# Function to restart a deployment
function krestart() {
  if [ -z "$1" ]; then
    echo "Usage: krestart <deployment-name>"
    return 1
  fi
  
  kubectl rollout restart deployment "$1"
  echo "Restarting deployment: $1"
  kubectl rollout status deployment "$1"
}


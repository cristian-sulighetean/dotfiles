# Kubernetes completion

if (( $+commands[kubectl] )); then
  # Enable kubectl completion
  source <(kubectl completion zsh)
  
  # Enable completion for k alias
  complete -o default -F __start_kubectl k
  
  # If using kubectx and kubens, enable their completions too
  if (( $+commands[kubectx] )); then
    autoload -U +X bashcompinit && bashcompinit
  fi
fi


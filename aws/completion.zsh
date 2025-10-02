# AWS CLI completion
if (( $+commands[aws] )); then
  # AWS CLI v2 completion for zsh
  autoload -U +X bashcompinit && bashcompinit
  
  # Find aws_completer in common locations
  if [[ -f /usr/local/bin/aws_completer ]]; then
    complete -C '/usr/local/bin/aws_completer' aws
  elif [[ -f /usr/bin/aws_completer ]]; then
    complete -C '/usr/bin/aws_completer' aws
  elif command -v aws_completer &> /dev/null; then
    complete -C aws_completer aws
  fi
fi


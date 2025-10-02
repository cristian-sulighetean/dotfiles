# Setup Homebrew path based on OS
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  # macOS Apple Silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f "/usr/local/bin/brew" ]]; then
  # macOS Intel
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  # Linux / WSL
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
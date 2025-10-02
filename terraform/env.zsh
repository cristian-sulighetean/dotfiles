# Terraform environment variables

# Enable detailed logging (uncomment if needed for debugging)
# export TF_LOG=DEBUG
# export TF_LOG_PATH=./terraform.log

# Disable telemetry
export CHECKPOINT_DISABLE=1

# Set default parallelism
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

# Create plugin cache directory if it doesn't exist
if [[ ! -d "$TF_PLUGIN_CACHE_DIR" ]]; then
  mkdir -p "$TF_PLUGIN_CACHE_DIR"
fi


# AWS environment configuration

# Default region (change to your preferred region)
export AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-us-east-1}"

# Enable CLI pager (set to empty string to disable)
# export AWS_PAGER=""

# AWS CLI auto-prompt mode (uncomment to enable)
# export AWS_CLI_AUTO_PROMPT=on-partial

# Function to quickly switch AWS profiles
function awsswitch() {
  if [ -z "$1" ]; then
    echo "Current AWS Profile: ${AWS_PROFILE:-default}"
    echo "\nAvailable profiles:"
    aws configure list-profiles 2>/dev/null || grep -E '^\[profile' ~/.aws/config | sed 's/\[profile \(.*\)\]/  - \1/' | sed 's/\[default\]/  - default/'
  else
    export AWS_PROFILE="$1"
    echo "Switched to AWS profile: $AWS_PROFILE"
    aws sts get-caller-identity 2>/dev/null || echo "Warning: Could not verify credentials"
  fi
}

# Function to show current AWS account info
function awsinfo() {
  echo "AWS Profile: ${AWS_PROFILE:-default}"
  echo "AWS Region: ${AWS_DEFAULT_REGION}"
  aws sts get-caller-identity 2>/dev/null
}


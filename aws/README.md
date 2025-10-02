# AWS Module

AWS CLI aliases, helper functions, and shell completions for efficient cloud infrastructure management.

## What's Included

### Aliases (`aliases.zsh`)

#### Identity & Profile Management
```bash
awswho        # aws sts get-caller-identity (who am I?)
awsprofile    # echo current AWS_PROFILE
awsp          # export AWS_PROFILE= (use: awsp my-profile)
```

#### S3 Operations
```bash
s3ls          # aws s3 ls
s3cp          # aws s3 cp
s3sync        # aws s3 sync
s3mb          # aws s3 mb (make bucket)
s3rb          # aws s3 rb (remove bucket)
```

#### EC2 Management
```bash
ec2ls         # List all instances with details (table format)
ec2running    # List only running instances (table format)
```

#### Lambda Functions
```bash
lambdals      # List all Lambda functions (table format)
```

#### CloudFormation
```bash
cfnls         # List stacks (table format)
cfnevents     # aws cloudformation describe-stack-events --stack-name
```

#### ECS/Fargate
```bash
ecsls         # List ECS clusters
ecstasks      # aws ecs list-tasks --cluster
```

#### CloudWatch Logs
```bash
logtail       # aws logs tail --follow
loggroups     # List all log groups (table format)
```

#### Systems Manager (SSM) Parameter Store
```bash
ssmget        # aws ssm get-parameter --name
ssmput        # aws ssm put-parameter --name
ssmls         # List all parameters (table format)
```

### Functions (`env.zsh`)

#### `awsswitch [profile]`
Switch between AWS profiles easily:

```bash
# Show current profile and list all available profiles
awsswitch

# Switch to a specific profile
awsswitch production
awsswitch dev
```

#### `awsinfo`
Display current AWS configuration and identity:

```bash
awsinfo
# Output:
# AWS Profile: production
# AWS Region: eu-central-1
# Account: 123456789012
# UserId: AIDAI...
# Arn: arn:aws:iam::123456789012:user/...
```

### Environment Variables (`env.zsh`)

- **`AWS_DEFAULT_REGION`** - Set to `us-east-1` by default (override in `.localrc`)
- **`AWS_PROFILE`** - Managed by `awsswitch` function
- **`AWS_PAGER`** - Uncomment to disable CLI pager
- **`AWS_CLI_AUTO_PROMPT`** - Uncomment to enable interactive mode

### Shell Completion (`completion.zsh`)

Auto-completion for all AWS CLI commands, subcommands, and resource names.

## Usage Examples

### Profile Management
```bash
# Check who you are
awswho

# Show current configuration
awsinfo

# Switch profiles
awsswitch dev
awswho  # Verify the switch
```

### EC2 Quick Reference
```bash
# See all instances
ec2ls

# See only running instances
ec2running

# Start an instance
aws ec2 start-instances --instance-ids i-1234567890abcdef0

# Stop an instance
aws ec2 stop-instances --instance-ids i-1234567890abcdef0
```

### S3 Operations
```bash
# List all buckets
s3ls

# List objects in a bucket
s3ls s3://my-bucket/

# Copy file to S3
s3cp myfile.txt s3://my-bucket/

# Sync directory to S3
s3sync ./dist/ s3://my-bucket/app/
```

### Lambda Management
```bash
# List all functions
lambdals

# Invoke a function
aws lambda invoke --function-name my-function output.json

# View function logs
logtail /aws/lambda/my-function
```

### Parameter Store
```bash
# List all parameters
ssmls

# Get a parameter value
ssmget /app/database/password --with-decryption

# Set a parameter
ssmput /app/config/api-key --value "secret123" --type SecureString
```

### CloudWatch Logs
```bash
# List log groups
loggroups

# Tail logs in real-time
logtail /aws/lambda/my-function

# Tail with filter
logtail /aws/lambda/my-function --filter-pattern "ERROR"
```

## Installation

The module is automatically loaded when you source your `.zshrc`. To install AWS CLI:

```bash
brew install awscli
```

Or if you've already updated the Brewfile:

```bash
cd ~/.dotfiles
brew bundle
```

## Configuration

### Setting Up Profiles

Create or edit `~/.aws/config`:

```ini
[default]
region = us-east-1
output = json

[profile production]
region = eu-central-1
output = json

[profile dev]
region = us-west-2
output = table
```

Create or edit `~/.aws/credentials`:

```ini
[default]
aws_access_key_id = YOUR_KEY
aws_secret_access_key = YOUR_SECRET

[production]
aws_access_key_id = PROD_KEY
aws_secret_access_key = PROD_SECRET

[dev]
aws_access_key_id = DEV_KEY
aws_secret_access_key = DEV_SECRET
```

### Using AWS SSO

For SSO-based authentication:

```bash
aws configure sso
# Follow the prompts

# Login
aws sso login --profile my-sso-profile

# Then switch
awsswitch my-sso-profile
```

## Customization

### Change Default Region

Add to `~/.localrc` (not tracked in git):

```bash
export AWS_DEFAULT_REGION="eu-central-1"
```

### Disable Pager

Uncomment in `aws/env.zsh`:

```bash
export AWS_PAGER=""
```

### Enable Auto-Prompt Mode

Uncomment in `aws/env.zsh`:

```bash
export AWS_CLI_AUTO_PROMPT=on-partial
```

### Add Custom Aliases

Edit `aws/aliases.zsh`:

```bash
alias myalias='aws ec2 describe-instances --filters "Name=tag:Environment,Values=prod"'
```

## Tips & Best Practices

1. **Always check your profile** with `awswho` before making changes
2. **Use table output** for human-readable results (already done in aliases!)
3. **Store credentials securely** - consider AWS SSO or IAM roles
4. **Use Parameter Store** for application secrets instead of environment variables
5. **Enable MFA** for production accounts
6. **Use `--dry-run`** flag when testing destructive commands

## Troubleshooting

### Completion not working
Make sure AWS CLI is installed and in PATH:
```bash
which aws
aws --version
```

### Profile not found
List available profiles:
```bash
awsswitch  # Shows all profiles
# or
aws configure list-profiles
```

### Credentials expired (SSO)
Re-login:
```bash
aws sso login --profile your-profile
```

## Learn More

- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)
- [AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
- [AWS SSO Setup](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)
- [AWS CLI Cheat Sheet](https://docs.aws.amazon.com/cli/latest/reference/)


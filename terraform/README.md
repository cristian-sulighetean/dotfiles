# Terraform Module

Terraform aliases, environment configuration, and shell completions for efficient Infrastructure as Code workflows.

## What's Included

### Aliases (`aliases.zsh`)

#### Basic Commands
```bash
tf          # terraform
tfi         # terraform init
tfp         # terraform plan
tfa         # terraform apply
tfd         # terraform destroy
tfv         # terraform validate
tff         # terraform fmt
tfw         # terraform workspace
tfo         # terraform output
tfs         # terraform state
```

#### Workflow Shortcuts
```bash
tfip        # terraform init && terraform plan
tfia        # terraform init && terraform apply
tfpa        # terraform plan && terraform apply
```

#### Quick Apply/Destroy (use with caution!)
```bash
tfaa        # terraform apply -auto-approve
tfda        # terraform destroy -auto-approve
```

#### Workspace Management
```bash
tfwl        # terraform workspace list
tfws        # terraform workspace select <name>
tfwn        # terraform workspace new <name>
```

### Environment Variables (`env.zsh`)

- **`CHECKPOINT_DISABLE=1`** - Disables Terraform telemetry/version checks
- **`TF_PLUGIN_CACHE_DIR`** - Centralized plugin cache at `~/.terraform.d/plugin-cache`
  - Saves disk space and speeds up `terraform init`
  - Automatically created if it doesn't exist

#### Optional Debug Settings
Uncomment in `env.zsh` to enable:
```bash
export TF_LOG=DEBUG              # Enable detailed logging
export TF_LOG_PATH=./terraform.log  # Write logs to file
```

### Shell Completion (`completion.zsh`)

Auto-completion for all Terraform commands and flags. Works automatically if Terraform is installed.

## Usage Examples

### Quick Start
```bash
# Initialize and plan in one command
tfip

# Apply changes
tfa

# View outputs
tfo
```

### Workspace Workflow
```bash
# List all workspaces
tfwl

# Create and switch to dev workspace
tfwn dev

# Switch between workspaces
tfws prod
tfws dev
```

### State Management
```bash
# List resources in state
tfs list

# Show a specific resource
tfs show aws_instance.example

# Move a resource
tfs mv aws_instance.old aws_instance.new
```

### Format and Validate
```bash
# Format all .tf files
tff

# Validate configuration
tfv
```

## Installation

The module is automatically loaded when you source your `.zshrc`. To install Terraform:

```bash
brew install terraform
```

Or if you've already updated the Brewfile:

```bash
cd ~/.dotfiles
brew bundle
```

## Customization

Edit the files to match your workflow:

- **Add more aliases**: Edit `terraform/aliases.zsh`
- **Change environment settings**: Edit `terraform/env.zsh`
- **Add custom functions**: Add them to `terraform/env.zsh`

## Tips

1. **Use workspace aliases** for multi-environment setups
2. **Enable plugin cache** to speed up initialization (already configured!)
3. **Be careful with auto-approve** aliases - they skip confirmation prompts
4. **Use `tfip`** as a quick sanity check before applying

## Learn More

- [Terraform Documentation](https://www.terraform.io/docs)
- [Terraform CLI Commands](https://www.terraform.io/cli/commands)
- [Terraform Workspaces](https://www.terraform.io/docs/language/state/workspaces.html)


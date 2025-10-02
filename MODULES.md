# Dotfiles Modules Overview

Quick reference guide for all available modules and their features.

## 📋 Quick Module Reference

| Module | Aliases | Functions | Completion | Description |
|--------|---------|-----------|------------|-------------|
| [aws/](aws/) | 30+ | 2 | ✅ | AWS CLI shortcuts and profile management |
| [kubernetes/](kubernetes/) | 50+ | 7 | ✅ | kubectl aliases and cluster management |
| [terraform/](terraform/) | 20+ | - | ✅ | Terraform workflow automation |
| atuin/ | - | - | ✅ | Shell history sync and search |
| docker/ | 2 | - | - | Docker and Docker Compose shortcuts |
| git/ | 10+ | - | ✅ | Git aliases and enhanced workflows |
| homebrew/ | - | - | - | Homebrew PATH and environment |
| system/ | 10+ | - | - | System-wide utilities and aliases |
| vim/ | - | - | - | Vim configuration |
| zsh/ | - | - | - | ZSH shell customization |

## 🚀 Most Useful Aliases

### Git (git/)
```bash
gs          # git status (short format)
gco         # git checkout
gp          # git push origin HEAD
gl          # git pull --prune
glog        # pretty git log
gac         # git add all + commit
```

### AWS (aws/)
```bash
awswho      # Show current identity
awsswitch   # Switch AWS profiles
awsinfo     # Show current config
ec2running  # List running instances
s3ls        # List S3 buckets/objects
ssmls       # List SSM parameters
logtail     # Tail CloudWatch logs
```

### Terraform (terraform/)
```bash
tf          # terraform
tfi         # terraform init
tfp         # terraform plan
tfa         # terraform apply
tfip        # init + plan
tfpa        # plan + apply
tfwl        # workspace list
tfws        # workspace select
```

### Kubernetes (kubernetes/)
```bash
k           # kubectl
kgp         # kubectl get pods
kgd         # kubectl get deployments
kgs         # kubectl get services
kctx        # current context
kns         # current namespace
kl          # kubectl logs
klf         # kubectl logs -f
kex         # kubectl exec -it
```

### Docker (docker/)
```bash
d           # docker
dc          # docker-compose
```

## 🔧 Useful Functions

### awsswitch [profile]
**Module**: aws/  
**Description**: Switch between AWS profiles easily

```bash
awsswitch              # Show current profile & list all
awsswitch production   # Switch to production
awsswitch dev          # Switch to dev
```

### awsinfo
**Module**: aws/  
**Description**: Display current AWS configuration and identity

```bash
awsinfo
# Shows:
# - Current profile
# - Current region
# - Account ID
# - User ARN
```

### kctxswitch [context]
**Module**: kubernetes/  
**Description**: Switch between kubectl contexts

```bash
kctxswitch              # List contexts
kctxswitch production   # Switch context
```

### knsswitch [namespace]
**Module**: kubernetes/  
**Description**: Switch namespaces in current context

```bash
knsswitch           # List namespaces
knsswitch prod      # Switch namespace
```

### kinfo
**Module**: kubernetes/  
**Description**: Show current cluster information

```bash
kinfo
# Shows cluster, namespace, nodes, pods, etc.
```

### klogs <pattern> [-f]
**Module**: kubernetes/  
**Description**: Get logs from first matching pod

```bash
klogs api           # Get logs
klogs nginx -f      # Follow logs
```

### kexec <pattern> [command]
**Module**: kubernetes/  
**Description**: Exec into first matching pod

```bash
kexec api           # Exec with /bin/sh
kexec app /bin/bash # Exec with bash
```

### krestart <deployment>
**Module**: kubernetes/  
**Description**: Restart a deployment

```bash
krestart api-deployment
```

## 📦 Installation Commands

### Bootstrap (first time)
```bash
cd ~/.dotfiles
script/bootstrap    # Creates symlinks
script/install      # Installs packages
source ~/.zshrc     # Reload shell
```

### Update Existing
```bash
cd ~/.dotfiles
git pull            # Get latest dotfiles
brew bundle         # Install new packages
source ~/.zshrc     # Reload
```

## 🎯 Common Workflows

### AWS Multi-Account Development
```bash
# Switch to dev account
awsswitch dev
awswho                    # Verify

# List running instances
ec2running

# Check logs
logtail /aws/lambda/my-function
```

### Terraform Deployment
```bash
# Initialize and plan
tfip

# Review changes
tfp

# Apply changes
tfa

# Switch workspace
tfws production
tfp
```

### Git Workflow
```bash
# Create branch
gcb feature/new-feature

# Make changes
gac "Add new feature"

# Push
gp

# Pretty log
glog
```

## 📚 Module Documentation

Each module has detailed documentation:

- **[aws/README.md](aws/README.md)** - Complete AWS CLI reference
- **[kubernetes/README.md](kubernetes/README.md)** - kubectl and cluster management
- **[terraform/README.md](terraform/README.md)** - Terraform workflows and tips
- **[README.md](README.md)** - Main dotfiles documentation

## 🛠️ Creating Your Own Module

1. Create directory: `mkdir ~/.dotfiles/mymodule`
2. Add files:
   - `aliases.zsh` - Your aliases
   - `env.zsh` - Environment config
   - `completion.zsh` - Auto-completion
   - `README.md` - Documentation
3. Add to `Brewfile`: `brew 'mytool'`
4. Install: `brew bundle && source ~/.zshrc`

## 💡 Tips & Tricks

### Use Tab Completion
All modules support tab completion for commands and flags:
```bash
tf [TAB]           # Shows terraform subcommands
aws s3 [TAB]       # Shows s3 subcommands
```

### Check Available Aliases
```bash
alias | grep aws   # Show all AWS aliases
alias | grep tf    # Show all Terraform aliases
alias | grep git   # Show all Git aliases
```

### Override in .localrc
Create `~/.localrc` for personal settings:
```bash
# Override default region
export AWS_DEFAULT_REGION="eu-west-1"

# Add custom aliases
alias myalias='some command'

# Personal settings
export MY_SECRET_KEY="xxx"
```

### Quick Reference
```bash
# Reload shell config
source ~/.zshrc

# See what's in PATH
echo $PATH | tr ':' '\n'

# List all functions
print -l ${(ok)functions}

# Show specific function
type awsswitch
```

## 🔍 Troubleshooting

### Shell not loading
```bash
# Check for syntax errors
zsh -n ~/.zshrc

# Reload with debug
zsh -x -c "source ~/.zshrc"
```

### Command not found
```bash
# Check if tool is installed
which terraform
which aws

# Install missing tools
cd ~/.dotfiles
brew bundle
```

### Completion not working
```bash
# Reload completions
rm -f ~/.zcompdump
compinit
```

## 🔗 Quick Links

- [Main README](README.md) - Installation and setup
- [AWS Module](aws/README.md) - AWS CLI documentation
- [Terraform Module](terraform/README.md) - Terraform documentation
- [Brewfile](Brewfile) - Package list

## 📊 Statistics

- **Total README lines**: 1,500+
- **Total modules**: 10
- **Total aliases**: 110+
- **Total functions**: 12+
- **Packages managed**: 14+ CLI tools


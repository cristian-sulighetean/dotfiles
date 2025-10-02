# Terraform aliases
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfv='terraform validate'
alias tff='terraform fmt'
alias tfw='terraform workspace'
alias tfo='terraform output'
alias tfs='terraform state'

# Common workflows
alias tfip='terraform init && terraform plan'
alias tfia='terraform init && terraform apply'
alias tfpa='terraform plan && terraform apply'

# Terraform with auto-approve (use with caution!)
alias tfaa='terraform apply -auto-approve'
alias tfda='terraform destroy -auto-approve'

# Workspace shortcuts
alias tfwl='terraform workspace list'
alias tfws='terraform workspace select'
alias tfwn='terraform workspace new'


# AWS CLI aliases
alias aws='aws'
alias awsl='aws s3 ls'
alias awswho='aws sts get-caller-identity'

# S3 shortcuts
alias s3ls='aws s3 ls'
alias s3cp='aws s3 cp'
alias s3sync='aws s3 sync'
alias s3mb='aws s3 mb'
alias s3rb='aws s3 rb'

# EC2 shortcuts
alias ec2ls='aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PublicIpAddress,Tags[?Key=='\''Name'\''].Value|[0]]" --output table'
alias ec2running='aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].[InstanceId,InstanceType,PublicIpAddress,Tags[?Key=='\''Name'\''].Value|[0]]" --output table'

# Lambda shortcuts
alias lambdals='aws lambda list-functions --query "Functions[*].[FunctionName,Runtime,LastModified]" --output table'

# CloudFormation shortcuts
alias cfnls='aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE --query "StackSummaries[*].[StackName,StackStatus,CreationTime]" --output table'
alias cfnevents='aws cloudformation describe-stack-events --stack-name'

# ECS shortcuts
alias ecsls='aws ecs list-clusters'
alias ecstasks='aws ecs list-tasks --cluster'

# Logs shortcuts
alias logtail='aws logs tail --follow'
alias loggroups='aws logs describe-log-groups --query "logGroups[*].logGroupName" --output table'

# SSM Parameter Store
alias ssmget='aws ssm get-parameter --name'
alias ssmput='aws ssm put-parameter --name'
alias ssmls='aws ssm describe-parameters --query "Parameters[*].[Name,Type,LastModifiedDate]" --output table'

# Profile switching helper
alias awsp='export AWS_PROFILE='
alias awsprofile='echo $AWS_PROFILE'


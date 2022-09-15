# SuccessStory

```sh
terraform init
terraform plan
terraform apply
terraform apply --auto-approve

terraform destroy
terraform destroy --auto-approve
terraform destroy -target aws_instance.myec2

terraform refresh

Loading Variable Values from CLI
terraform plan -var="instancetype=t2.small"

Loading from custom tfvars file
terraform plan -var-file="custom.tfvars"

export TF_LOG=TRACE # DEBUG, INFO, WARN, ERROR
export TF_LOG_PATH=/tmp/crash.log

terraform plan -out=demopath
terraform apply demopath

terraform state

terraform taint aws_instance.myec2
terraform untaint aws_instance.myec2

terraform fmt
terraform validate

terrafrom plan -refresh=false -target aws_instance.myec2

terraform workspace -h

Lifecycle
create_before_destroy = true
prevent_destroy = true
ignore_changes = true

terraform get
terraform import
```

# SuccessStory

## Terraform Installation

For RHEL :
```sh
yum install docker -y   
service docker status
service docker start
docker version
systemctl enable docker
```

terraform init
terraform plan
terraform apply --auto-approve

terraform destroy --auto-approve
terraform destroy -target aws_instance.myec2![image](https://user-images.githubusercontent.com/32792363/178094835-1b92451a-45bf-41b4-ad4c-cffb6d41c12b.png)

Loading Variable Values from CLI
terraform plan -var="instancetype=t2.small"

Loading from custom tfvars file
terraform plan -var-file="custom.tfvars"

export TF_LOG=TRACE
export TF_LOG_PATH=/tmp/crash.log

terraform plan -out=demopath
terraform apply demopath

terraform state

terraform taint aws_instance.myec2
terraform untaint aws_instance.myec2

terraform fmt
terraform validate

terraform workspace -h
terraform workspace show
terraform workspace new dev
terraform workspace list
terraform workspace select dev

Lifecycle
createbeforedestroy = true
preventdestroy = true
ignorechanges = true

terraform get
terraform import
```

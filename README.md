# jupyterlab-terraform
jupyterlabs with terraform

## Requirements
- [Terraform](https://www.terraform.io/intro/getting-started/install.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

## install

navigate to `terraform/variables.tf` and change necessary `KeyPair` names and other info relevant to personal setup.
```
cd terraform
terraform init
terraform apply
```

LICENSE
---
MIT
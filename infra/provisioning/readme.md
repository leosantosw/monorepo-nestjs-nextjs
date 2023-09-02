# Terraform

This repository contains Terraform configurations and scripts for provisioning infrastructure using Terraform. The project is structured as follows:

## Directory Structure

```
provisioning
├── readme.md
├── scripts
│   └── deploy_ecr.sh
├── modules
│   ├── erc.tf
│   ├── provider.tf
│   └── variables.tf
├── production
│   └── main.tf
└── staging
    ├── main.tf
```

## Environment Configuration

This section outlines the configuration variables required for the `production` and `staging` environments in your Terraform project. These variables are used to customize the infrastructure provisioning process.

### Production Environment

In the `production` or `staging` directory, you can configure the following variables in the `main.tf` file to customize your production environment:

Example for production:
```hcl
module "production" {
    source = "../modules"

    aws_region = "us-east-1"       # Set the AWS region for the production environment
    aws_profile = "default-production"  # Set the AWS profile to use for authentication

    repository_name = "apps-production"  # Set the name of the Elastic Container Registry (ECR) repository for production
}
```

## Execute Commands

To start using this Terraform project, follow these steps:

1. Clone this repository to your local machine.

2. Run `terraform init` in each environment directory to initialize Terraform.

3. Run `terraform plan` to see the execution plan for each environment.

4. Run `terraform apply -auto-approve` to provision the infrastructure defined in your Terraform configurations.


## Destroying the Infrastructure

After using the infrastructure, you may need to destroy it when it's no longer needed or to avoid unnecessary costs. Be cautious as this operation is irreversible.

To perform the destroy:

1. Open a terminal or command prompt.

2. Navigate to the directory of the respective environment you wish to destroy (e.g., `production` or `staging`).

3. Run the `terraform destroy` command to initiate the destruction process. Terraform will list the resources to be destroyed and request confirmation.
```shell
   terraform destroy
```

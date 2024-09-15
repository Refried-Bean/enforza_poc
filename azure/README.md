# Enforza.io Firewall PoC Terraform Repository (Azure Version)

This repository contains Terraform infrastructure definitions for a proof of concept (PoC) deployment of the Enforza.io firewall product on Microsoft Azure.

## Prerequisites

Before you can use this Terraform configuration, you need to create a secrets file with the necessary credentials and sensitive information.

### Creating the Secrets File

1. Create a new file named `secrets.tfvars` in the root directory of this repository.
2. Add the following variables to the file, replacing the placeholder values with your actual credentials:

```hcl
enforza_company_id = "your_enforza_company_id_here"
subscription_id    = "your_azure_subscription_id_here"
client_id          = "your_azure_client_id_here"
client_secret      = "your_azure_client_secret_here"
tenant_id          = "your_azure_tenant_id_here"
admin_password     = "your_vm_admin_password_here"
```

**Important:**
- Do not commit the `secrets.tfvars` file to version control. Add it to your `.gitignore` file to prevent accidental commits.
- Ensure that you have the necessary permissions in your Azure subscription to create the resources defined in this Terraform configuration.

## Usage

To use this Terraform configuration:

1. Ensure you have Terraform installed on your local machine.
2. Initialize the Terraform working directory:
   ```
   terraform init
   ```
3. Plan the deployment:
   ```
   terraform plan -var-file="secrets.tfvars"
   ```
4. Apply the configuration:
   ```
   terraform apply -var-file="secrets.tfvars"
   ```

## Infrastructure Details

This Terraform configuration will create:
- A Resource Group in Azure
- A Virtual Network with three subnets (protected, firewall, and bastion)
- Virtual Machines in each subnet
- Necessary route tables and network security groups
- The bastion VM will have a public IP for access

## Contributing

Push Requests encouraged.

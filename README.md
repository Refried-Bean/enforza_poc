# Enforza.io Firewall Proof of Concept

This repository contains Terraform infrastructure definitions for a proof of concept (PoC) deployment of the Enforza.io firewall product.

## Prerequisites

Before you can use this Terraform configuration, you need to create a secrets file with the necessary credentials and sensitive information.

### Creating the Secrets File

1. Create a new file named `secrets.tfvars` in the root directory of this repository.
2. Add the following variables to the file, replacing the placeholder values with your actual credentials:

```hcl
enforza_company_id = "your_enforza_company_id_here"
aws_access_key = "your_aws_access_key_here"
aws_secret_key = "your_aws_secret_key_here"
```

**Important:** Do not commit the `secrets.tfvars` file to version control. Add it to your `.gitignore` file to prevent accidental commits.

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

## Contributing

Push requests welcome.

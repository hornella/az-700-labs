# AZ-700 Terraform Labs

Terraform implementation of the Azure networking labs used during my AZ-700 study.

The goal of this repository is to recreate the lab environment with Infrastructure as Code while learning Azure networking and Terraform.

## Current Lab

### Virtual Networks

The current configuration deploys:

* Core Services VNet and subnets
* Manufacturing VNet and subnets
* Research VNet and subnets
* Gateway subnet required for later Virtual Network Gateway labs

The Azure resource group already exists and is referenced using a Terraform `data` source.

## Structure

```text
.
├── versions.tf     # Terraform and provider requirements
├── provider.tf     # AzureRM provider configuration
├── data.tf         # Existing Azure resources
└── vnet.tf         # Virtual networks and subnets
```

Additional resources will be added incrementally as the AZ-700 labs progress.

## Usage

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Review proposed changes:

```bash
terraform plan
```

Deploy:

```bash
terraform apply
```

Destroy Terraform-managed lab resources:

```bash
terraform destroy
```


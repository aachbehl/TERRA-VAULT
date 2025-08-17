# Terraform Vault-AWS Example

This project shows how to use Terraform to provision an AWS EC2 instance and fetch secrets from HashiCorp Vault.

## 🔧 Providers

- **AWS**: Deploys resources in `us-east-1`.
- **Vault**: Connects to Vault using AppRole authentication.

## 🔐 Vault Secret

Retrieves a secret (`test-secret`) from the `kv` secrets engine.

## 🚀 AWS EC2 Instance

Creates a `t2.micro` EC2 instance and tags it with a secret value (`username`) from Vault.

## 📦 Setup

1. Replace placeholders:
   - `<ec2-instance>`
   - `<role-id>`
   - `<secret-id>`

2. Run:
   ```bash
   terraform init
   terraform apply

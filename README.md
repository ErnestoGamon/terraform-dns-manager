# Terraform DNS Manager

![Logo](assets/logo.png)

[![Terraform CI](https://github.com/ErnestoGamon/terraform-dns-manager/actions/workflows/terraform.yml/badge.svg)](https://github.com/ErnestoGamon/terraform-dns-manager/actions/workflows/terraform.yml)

A comprehensive Terraform module for managing existing domains through Namecheap and Cloudflare. This module helps you:
- Configure nameservers for existing Namecheap domains
- Create and manage Cloudflare zones
- Configure DNS records in Cloudflare
- Automatically set up Cloudflare nameservers in existing Namecheap domains

## Usage from GitHub

```hcl
module "dns_manager" {
  source = "github.com/ErnestoGamon/terraform-dns-manager"

  # Namecheap Configuration
  namecheap_user        = "your_namecheap_user"
  namecheap_api_user    = "your_namecheap_api_user"
  namecheap_api_key     = "your_namecheap_api_key"
  namecheap_use_sandbox = false
  domain_name           = "example.com"

  # Cloudflare Configuration
  cloudflare_api_token  = "your_cloudflare_api_token"
  cloudflare_account_id = "your_cloudflare_account_id"
  cloudflare_zone_name  = "example.com"

  # DNS Records Configuration
  dns_records = [
    {
      name    = "www"
      type    = "A"
      ttl     = 3600
      value   = "192.0.2.1"
      proxied = true
    },
    {
      name     = "mail"
      type     = "MX"
      ttl      = 3600
      value    = "mail.example.com"
      proxied  = false
      priority = 10
    }
  ]
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| cloudflare | ~> 4.0 |
| namecheap | >= 2.0 |

## Providers

This module uses the following providers:
- Cloudflare
- Namecheap

## Input Variables

### Namecheap Variables

| Name | Description | Type | Required |
|------|-------------|------|----------|
| namecheap_user | Namecheap user | string | yes |
| namecheap_api_user | Namecheap API user | string | yes |
| namecheap_api_key | Namecheap API key | string | yes |
| namecheap_use_sandbox | Use Namecheap sandbox environment | bool | no |
| domain_name | Domain name to manage | string | yes |

### Cloudflare Variables

| Name | Description | Type | Required |
|------|-------------|------|----------|
| cloudflare_api_token | Cloudflare API token | string | yes |
| cloudflare_account_id | Cloudflare account ID | string | yes |
| cloudflare_zone_name | Cloudflare zone name | string | yes |

### DNS Records

The `dns_records` variable accepts a list of objects with the following schema:

```hcl
dns_records = [
  {
    name     = string
    type     = string
    ttl      = number
    value    = string
    proxied  = bool
    comment  = optional(string)
    priority = optional(number)
    tags     = optional(list(string))
  }
]
```

## Sub-modules

This module includes the following sub-modules:
- `cloudflare_zone`: Manages Cloudflare zones
- `cloudflare_records`: Manages DNS records in Cloudflare
- `namecheap`: Manages domain registration and nameservers in Namecheap

## Example with all features

```hcl
module "dns_manager" {
  source = "github.com/ErnestoGamon/terraform-dns-manager"

  # Namecheap Configuration
  namecheap_user        = var.namecheap_user
  namecheap_api_user    = var.namecheap_api_user
  namecheap_api_key     = var.namecheap_api_key
  namecheap_use_sandbox = false
  domain_name           = "example.com"

  # Cloudflare Configuration
  cloudflare_api_token  = var.cloudflare_api_token
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_zone_name  = "example.com"

  # DNS Records
  dns_records = [
    {
      name    = "www"
      type    = "A"
      ttl     = 3600
      value   = "192.0.2.1"
      proxied = true
      tags    = ["production"]
    },
    {
      name     = "mail"
      type     = "MX"
      ttl      = 3600
      value    = "mail.example.com"
      proxied  = false
      priority = 10
      comment  = "Main mail server"
    }
  ]
}
```

## License

MIT

## Author

Ernesto Gamon

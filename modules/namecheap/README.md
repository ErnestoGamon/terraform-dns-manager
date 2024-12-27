# Namecheap DNS Manager Module

This Terraform module manages DNS records for a domain using Namecheap.

## Usage

To use this module, include it in your Terraform configuration as follows:

```hcl
module "namecheap_dns" {
  source = "git::https://github.com/ErnestoGamon/terraform-dns-manager.git//modules/namecheap?ref=v1.0.0"

  namecheap_user       = var.namecheap_user
  namecheap_api_user   = var.namecheap_api_user
  namecheap_api_key    = var.namecheap_api_key
  namecheap_use_sandbox = var.namecheap_use_sandbox
  domain_name          = var.domain_name
  nameservers          = var.nameservers
}
```

## Variables

- `namecheap_user`: (Required) Namecheap user.
- `namecheap_api_user`: (Required) Namecheap API user.
- `namecheap_api_key`: (Required) Namecheap API key.
- `namecheap_use_sandbox`: (Optional) Use Namecheap sandbox environment. Default is `false`.
- `domain_name`: (Required) Domain name that we want to manage.
- `nameservers`: (Required) List of nameservers for the domain.

## Outputs

This module does not have any outputs.

## Versioning

It is recommended to pin the module version using the `?ref=` parameter in the source URL. For example, `?ref=v1.0.0`.

## License

This project is licensed under the MIT License.

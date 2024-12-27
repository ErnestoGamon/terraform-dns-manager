# Cloudflare Zone Module

This module manages a Cloudflare DNS zone.

## Usage

```hcl
module "cloudflare_zone" {
  source = "./modules/cloudflare_zone"

  cloudflare_api_token   = "your_cloudflare_api_token"
  cloudflare_account_id  = "your_cloudflare_account_id"
  cloudflare_zone_name   = "your_zone_name"
  
  # Optional parameters
  jump_start          = false
  paused             = false
  plan               = "free"
  type               = "full"
  vanity_name_servers = []
}
```

## Inputs

| Name                  | Description                                | Type         | Default | Required |
|----------------------|--------------------------------------------|--------------|---------|----------|
| cloudflare_api_token | The Cloudflare API token                   | string       | n/a     | yes      |
| cloudflare_account_id| The Cloudflare account ID                  | string       | n/a     | yes      |
| cloudflare_zone_name | The Cloudflare zone name                   | string       | n/a     | yes      |
| jump_start          | Whether to scan for DNS records on creation | bool         | false   | no       |
| paused             | Whether zone is paused                      | bool         | false   | no       |
| plan               | Commercial plan for the zone                | string       | "free"  | no       |
| type               | Zone type (full, partial, or secondary)     | string       | "full"  | no       |
| vanity_name_servers | List of Vanity Nameservers                 | list(string) | []      | no       |

## Outputs

| Name                   | Description                        |
|------------------------|------------------------------------|
| cloudflare_name_servers| The name servers of the Cloudflare zone |
| cloudflare_zone_id     | The ID of the Cloudflare zone      |

## Providers

| Name       | Version |
|------------|---------|
| cloudflare | ~> 4.0  |

## Resources

| Name            | Type          |
|-----------------|---------------|
| cloudflare_zone | resource      |

## Example

```hcl
module "cloudflare_zone" {
  source = "./modules/cloudflare_zone"

  cloudflare_api_token   = "your_cloudflare_api_token"
  cloudflare_account_id  = "your_cloudflare_account_id"
  cloudflare_zone_name   = "your_zone_name"
  
  # Optional parameters
  jump_start          = false
  paused             = false
  plan               = "free"
  type               = "full"
  vanity_name_servers = []
}
```

## Author

Ernesto Gamon

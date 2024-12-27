# Cloudflare DNS Records Module

This module manages DNS records in Cloudflare.

## Usage

```hcl
module "cloudflare_records" {
  source = "./modules/cloudflare_records"

  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_zone_id   = var.cloudflare_zone_id
  dns_records = [
    {
      name    = "example"
      type    = "A"
      ttl     = 3600
      value   = "192.0.2.1"
      proxied = false
      comment = "Example DNS record"
      priority = 10
      tags     = ["tag1", "tag2"]
    }
  ]
}
```

## Variables

- `cloudflare_api_token` (string, required): The Cloudflare API token.
- `cloudflare_zone_id` (string, required): The Cloudflare zone ID.
- `dns_records` (list(object), required): The DNS records to create. Each record supports the following attributes:
  - `name` (string, required): DNS record name.
  - `type` (string, required): Record type.
  - `ttl` (number, required): Time To Live (TTL) of the DNS record in seconds.
  - `value` (string, required): The value of the DNS record.
  - `proxied` (bool, required): Whether the record is proxied by Cloudflare.
  - `comment` (string, optional): Comments or notes about the DNS record.
  - `priority` (number, optional): Required for MX, SRV, and URI records; unused by other record types.
  - `tags` (list(string), optional): Custom tags for the DNS record.

## Outputs

None.

## Example

```hcl
module "cloudflare_records" {
  source = "./modules/cloudflare_records"

  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_zone_id   = var.cloudflare_zone_id
  dns_records = [
    {
      name    = "example"
      type    = "A"
      ttl     = 3600
      value   = "192.0.2.1"
      proxied = false
      comment = "Example DNS record"
      priority = 10
      tags     = ["tag1", "tag2"]
    }
  ]
}
```

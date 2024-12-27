resource "cloudflare_zone" "domain_zone" {
  account_id = var.cloudflare_account_id
  zone       = var.cloudflare_zone_name
}

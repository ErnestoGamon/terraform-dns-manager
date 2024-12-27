resource "cloudflare_zone" "domain_zone" {
  account_id          = var.cloudflare_account_id
  zone                = var.cloudflare_zone_name
  jump_start          = var.jump_start
  paused              = var.paused
  plan                = var.plan
  type                = var.type
  vanity_name_servers = var.vanity_name_servers
}

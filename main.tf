resource "cloudflare_zone" "domains" {
  for_each   = toset(var.domains)
  account_id = var.cloudflare_account_id
  zone       = each.value
}

resource "namecheap_domain_records" "domains" {
  for_each = toset(var.domains)
  domain   = each.value
  mode     = "OVERWRITE"

  nameservers = cloudflare_zone.domains[each.key].name_servers
}

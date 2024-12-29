output "zone_ids" {
  value = {
    for domain, zone in cloudflare_zone.domains : domain => zone.id
  }
  description = "Map of domain names to their corresponding Cloudflare zone IDs"
}

output "cloudflare_name_servers" {
  description = "The name servers of the Cloudflare zone"
  value       = cloudflare_zone.domain.name_servers
}

output "cloudflare_zone_id" {
  description = "The ID of the Cloudflare zone"
  value       = cloudflare_zone.domain_zone.id
}

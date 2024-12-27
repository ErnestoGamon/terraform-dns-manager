resource "cloudflare_dns_record" "records" {
  for_each = { for record in var.dns_records : record.name => record }

  zone_id = var.cloudflare_zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = each.value.ttl
  value   = each.value.value
  proxied = each.value.proxied

  comment  = lookup(each.value, "comment", null)
  priority = lookup(each.value, "priority", null)
  tags     = lookup(each.value, "tags", null)
}

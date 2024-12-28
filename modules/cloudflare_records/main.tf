resource "cloudflare_record" "records" {
  for_each = { for idx, record in var.dns_records : "${record.name}-${record.type}-${idx}" => record }

  zone_id         = var.cloudflare_zone_id
  name            = each.value.name
  type            = each.value.type
  ttl             = each.value.ttl
  content         = each.value.content
  proxied         = lookup(each.value, "proxied", null)
  comment         = lookup(each.value, "comment", null)
  priority        = lookup(each.value, "priority", null)
  tags            = lookup(each.value, "tags", null)
  allow_overwrite = lookup(each.value, "allow_overwrite", null)
}

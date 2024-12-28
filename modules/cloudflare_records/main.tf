resource "cloudflare_record" "records" {
  for_each = { for idx, record in var.dns_records : "${record.name}-${record.type}-${idx}" => record }

  zone_id         = var.cloudflare_zone_id
  name            = each.value.name
  type            = each.value.type
  ttl             = each.value.ttl
  content         = each.value.value # Using value from input directly
  proxied         = lookup(each.value, "proxied", null)
  comment         = lookup(each.value, "comment", null)
  priority        = lookup(each.value, "priority", null)
  tags            = lookup(each.value, "tags", null)
  allow_overwrite = lookup(each.value, "allow_overwrite", null)

  dynamic "data" {
    for_each = lookup(each.value, "data", null) != null ? [each.value.data] : []
    content {
      service     = lookup(data.value, "service", null)
      proto       = lookup(data.value, "proto", null)
      name        = lookup(data.value, "name", null)
      priority    = lookup(data.value, "priority", null)
      weight      = lookup(data.value, "weight", null)
      port        = lookup(data.value, "port", null)
      target      = lookup(data.value, "target", null)
      flags       = lookup(data.value, "flags", null)
      tag         = lookup(data.value, "tag", null)
      value       = lookup(data.value, "value", null)
      algorithm   = lookup(data.value, "algorithm", null)
      type        = lookup(data.value, "type", null)
      certificate = lookup(data.value, "certificate", null)
      usage       = lookup(data.value, "usage", null)
      selector    = lookup(data.value, "selector", null)
    }
  }
}

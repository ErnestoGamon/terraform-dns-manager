resource "namecheap_domain_records" "domain" {
  domain = var.domain_name
  mode   = "OVERWRITE"

  nameservers = var.nameservers
}

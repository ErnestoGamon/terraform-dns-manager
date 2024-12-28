module "zone" {
  source                = "./modules/cloudflare_zone"
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_zone_name  = var.cloudflare_zone_name
  cloudflare_api_token  = var.cloudflare_api_token
  cloudflare_email      = var.cloudflare_email

}

module "domain_register" {
  source                = "./modules/namecheap"
  namecheap_user        = var.namecheap_user
  namecheap_api_user    = var.namecheap_api_user
  namecheap_api_key     = var.namecheap_api_key
  namecheap_use_sandbox = var.namecheap_use_sandbox
  domain_name           = var.domain_name
  nameservers           = module.zone.cloudflare_name_servers
}

module "cloudflare_records" {
  source               = "./modules/cloudflare_records"
  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_zone_id   = module.zone.cloudflare_zone_id
  dns_records          = var.dns_records
  cloudflare_email     = var.cloudflare_email
}



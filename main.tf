module "zone" {
  source                = "./modules/cloudflare_zone"
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_zone_name  = var.cloudflare_zone_name
  cloudflare_api_token  = var.cloudflare_api_token
}

module "domain_register" {
  source                = "./modules/namecheap"
  namecheap_user        = var.namecheap_user
  namecheap_api_user    = var.namecheap_api_user
  namecheap_api_key     = var.namecheap_api_key
  namecheap_use_sandbox = var.namecheap_use_sandbox
  domain_name           = var.domain_name
  nameservers           = module.zone.cloudflare_zone_name_servers
}



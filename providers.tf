provider "cloudflare" {
  api_key = var.cloudflare_api_key
  email   = var.cloudflare_email
}

provider "namecheap" {
  user_name   = var.namecheap_user
  api_user    = var.namecheap_user
  api_key     = var.namecheap_api_key
  use_sandbox = false
}


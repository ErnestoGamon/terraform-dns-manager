variable "namecheap_user" {
  description = "Namecheap user"
  type        = string
  sensitive   = true
}

variable "namecheap_api_user" {
  description = "Namecheap API user"
  type        = string
  sensitive   = true
}

variable "namecheap_api_key" {
  description = "Namecheap API key"
  type        = string
  sensitive   = true
}

variable "namecheap_use_sandbox" {
  description = "Use Namecheap sandbox environment"
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "Domain name that we want to manage"
  type        = string
  sensitive   = false
}

variable "cloudflare_account_id" {
  description = "The Cloudflare account ID"
  type        = string
  sensitive   = false
}

variable "cloudflare_zone_name" {
  description = "The Cloudflare zone name"
  type        = string
  sensitive   = false
}

variable "cloudflare_api_token" {
  description = "The Cloudflare API token"
  type        = string
  sensitive   = true
}


variable "dns_records" {
  description = "The DNS records to create"
  type = list(object({
    name            = string
    type            = string
    ttl             = number
    content         = string
    proxied         = optional(bool)
    comment         = optional(string)
    priority        = optional(number)
    tags            = optional(list(string))
    allow_overwrite = optional(bool)
  }))
  sensitive = false
}

variable "cloudflare_api_token" {
  description = "The Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudflare_email" {
  description = "The Cloudflare email"
  type        = string
  sensitive   = false
}

variable "cloudflare_zone_id" {
  description = "The Cloudflare zone ID"
  type        = string
  sensitive   = false
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

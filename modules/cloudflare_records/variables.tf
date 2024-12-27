variable "cloudflare_api_token" {
  description = "The Cloudflare API token"
  type        = string
  sensitive   = true
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
    content         = optional(string)
    proxied         = optional(bool)
    comment         = optional(string)
    priority        = optional(number)
    tags            = optional(list(string))
    allow_overwrite = optional(bool)
    data = optional(object({
      service     = optional(string)
      proto       = optional(string)
      name        = optional(string)
      priority    = optional(number)
      weight      = optional(number)
      port        = optional(number)
      target      = optional(string)
      flags       = optional(string)
      tag         = optional(string)
      value       = optional(string)
      algorithm   = optional(number)
      type        = optional(number)
      certificate = optional(string)
      usage       = optional(number)
      selector    = optional(number)
      fingerprint = optional(string)
      protocol    = optional(number)
      public_key  = optional(string)
      digest      = optional(string)
      digest_type = optional(number)
    }))
  }))
  sensitive = false
}

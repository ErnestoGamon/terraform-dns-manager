variable "cloudflare_api_key" {
  description = "The Cloudflare API key"
  type        = string
}

variable "cloudflare_email" {
  description = "The Cloudflare email"
  type        = string
}

variable "namecheap_user" {
  description = "The Namecheap user"
  type        = string
}

variable "namecheap_api_key" {
  description = "The Namecheap API key"
  type        = string
}

variable "cloudflare_account_id" {
  description = "The Cloudflare account ID"
  type        = string
  default     = "d3ce89acddde1a0854ef3d6c3d64251b"
}

variable "domains" {
  type        = list(string)
  description = "List of domain names to create resources for"
}

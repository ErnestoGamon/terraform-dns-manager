variable "cloudflare_api_token" {
  description = "The Cloudflare API token"
  type        = string
  sensitive   = true
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

variable "jump_start" {
  description = "Whether to scan for DNS records on creation"
  type        = bool
  default     = false
}

variable "paused" {
  description = "Whether this zone is paused (traffic bypasses Cloudflare)"
  type        = bool
  default     = false
}

variable "plan" {
  description = "The name of the commercial plan to apply to the zone"
  type        = string
  default     = "free"
  validation {
    condition     = contains(["free", "lite", "pro", "pro_plus", "business", "enterprise", "partners_free", "partners_pro", "partners_business", "partners_enterprise"], var.plan)
    error_message = "Plan must be one of: free, lite, pro, pro_plus, business, enterprise, partners_free, partners_pro, partners_business, partners_enterprise"
  }
}

variable "type" {
  description = "Zone type (full, partial, or secondary)"
  type        = string
  default     = "full"
  validation {
    condition     = contains(["full", "partial", "secondary"], var.type)
    error_message = "Type must be one of: full, partial, secondary"
  }
}

variable "vanity_name_servers" {
  description = "List of Vanity Nameservers"
  type        = list(string)
  default     = []
}

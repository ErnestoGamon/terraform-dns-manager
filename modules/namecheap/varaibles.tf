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
}

variable "nameservers" {
  description = "Nameservers for the domain"
  type        = list(string)
}

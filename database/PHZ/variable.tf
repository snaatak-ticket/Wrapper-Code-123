variable "private_ips" {
  description = "List of private IPs of EC2 instances"
  type        = list(string)
}

variable "route53_zone_id" {
  description = "The ID of the private hosted zone"
  type        = string
}

variable "private_domain_name" {
  description = "The domain name for the private hosted zone (e.g. internal.example.com)"
  type        = string
}

variable "name_prefix" {
  description = "Prefix to use for the A records (e.g. app-)"
  type        = list(string)
}

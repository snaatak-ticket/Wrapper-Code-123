variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}


variable "key_name" {
  description = "The name of the SSH key to use for the EC2 instance"
  type        = string
}
variable "env" {
  type        = string
  description = "enter env name"
}

variable "project_name" {
  description = "Project name identifier"
  type        = string

}
variable "instance_name" {
  description = "Project name identifier"
  type        = list(string)
}
variable "owner_name" {
  description = "Owner Name"
  type        = string
}

variable "number_of_instances" {
  description = "Number of instances to create"
  type        = string
}


variable "device_name" {
  type    = string
  default = "/dev/sda1"
}

variable "ebs_volume_size" {
  type    = string
  default = "15"
}

variable "ebs_volume_type" {
  type    = string
  default = "gp2"
}

variable "delete_on_termination" {
  type    = bool
  default = true
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
  type        = string
}

variable "aws_region" {
  type        = string
  description = "Enter region name"
}

variable "number_of_instances" {
  description = "Number of EC2 instances to launch"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "project_name" {
  description = "Project name identifier"
  type        = string
}

variable "instance_name" {
  description = "Instance name identifier"
  type        = string
}

variable "owner" {
  description = "Project owner identifier"
  type        = string
}

variable "device_name" {
  description = "EBS device name"
  type        = string
}

variable "ebs_volume_size" {
  description = "EBS volume size in GB"
  type        = number
}

variable "ebs_volume_type" {
  description = "EBS volume type"
  type        = string
}

variable "delete_on_termination" {
  description = "Delete volume on instance termination"
  type        = bool
}

variable "ami_name_filter" {
  description = "Filter value for AMI lookup"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}
variable "ami_id" {
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
  default     = "dev"
}

variable "project_name" {
  description = "Project name identifier"
  type        = string
  default     = "otms"

}
variable "instance_name" {
  description = "Project name identifier"
  type        = string
}

######################

variable "subnet_id" {
  description = "The subnet ID to deploy resources"
  type        = string
}

variable "security_groups" {
  description = "The security group IDs to associate with the EC2 instance"
  type        = list(string)
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



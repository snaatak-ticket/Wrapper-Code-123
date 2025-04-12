variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "enter region name"
}

variable "number_of_instances" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 1
}

# variable "ami_id" {
#   description = "AMI ID for the EC2 instances"
#   type        = string
# }

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "otms_dev"
}

# variable "subnet_id" {
#   description = "Subnet ID where the EC2 instance will be launched"
#   type        = string
# }

# variable "security_groups" {
#   description = "List of security group IDs"
#   type        = list(string)
# }

####tags###########
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
  type        = string
}

variable "owner" {
  description = "Project creater identifier"
  type        = string
}

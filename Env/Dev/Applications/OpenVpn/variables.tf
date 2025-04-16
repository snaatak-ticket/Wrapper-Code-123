variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "enter region name"
}

variable "number_of_instances" {
  description = "Number of EC2 instances to launch"
  type        = number

}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
 }

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

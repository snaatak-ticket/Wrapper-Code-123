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

variable "device_name" {
  type    = string
  default = "/dev/sda1"
}

variable "ebs_volume_size" {
  type = number
  description = "EBS volume size in GB"
}

variable "ebs_volume_type" {
  type = string
  description = "EBS volume type"
}


variable "delete_on_termination" {
  type        = bool
  description = "Whether the volume should be deleted on instance termination"
}

 variable "public_subnet_key" {
  description = "Key to fetch the public subnet from remote state"
  type        = string 
}

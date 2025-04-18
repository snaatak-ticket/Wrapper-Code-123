terraform {
  backend "s3" {
    bucket         = "otms-sprint5-bucket"
    key            = "env/dev/module/database/redis/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "dev-otms-tf-lock-table"
  }
}

data "terraform_remote_state" "otms_vpc" {
  backend = "s3"

  config = {
    bucket         = "otms-sprint5-bucket"
    key            = "env/dev/module/network-skeleton/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "dev-otms-tf-lock-table"
  }
}

data "aws_ami" "redis_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_name_filter]
  }
  owners = ["self"]
}

data "terraform_remote_state" "otms_vpc" {
  backend = "s3"

  config = {
    bucket = "p12-bucket-tfstate"
    key    = "env/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "attendance_ami" {
  filter {
    name   = "name"
    values = ["attendance _ami_copy"]
  }
}

data "terraform_remote_state" "http_arn" {
  count = var.enable_http_listener ? 0 : 1
  backend = "s3"

  config = {
    bucket = "p12-bucket-tfstate"
    key    = "env/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
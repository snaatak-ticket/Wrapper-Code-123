data "terraform_remote_state" "otms_ns" {
  backend = "s3"

  config = {
    bucket = "otms-sprint5-bucket"
    key    = "env/dev/module/network-skeleton/terraform.tfstate"
    region = "us-east-2"
  }
}

data "aws_ami" "attendance_ami" {
  filter {
    name   = "name"
    values = ["dev-otms-attendance-ami"]
  }
}

data "terraform_remote_state" "frontend" {
  count   = var.enable_http_listener ? 0 : 1
  backend = "s3"

  config = {
    bucket = "otms-sprint5-bucket"
    key    = "env/dev/Applications/Frontend/terraform.tfstate"
    region = "us-east-2"
  }
}
data "terraform_remote_state" "otms_ns" {
  backend = "s3"

  config = {
    bucket = "prod-otms-bucket"
    key    = "env/dev/module/network-skeleton/terraform.tfstate"
    region = "us-east-2"
  }
}

data "aws_ami" "employee_ami" {
  filter {
    name   = "name"
    values = ["employee ami"]
  }
}

data "terraform_remote_state" "frontend" {
  count   = var.enable_http_listener ? 0 : 1
  backend = "s3"

  config = {
    bucket = "prod-otms-bucket"
    key    = "env/dev/module/Applications/Frontend/terraform.tfstate"
    region = "us-east-2"
  }
}

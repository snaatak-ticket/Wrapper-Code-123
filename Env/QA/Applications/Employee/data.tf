data "terraform_remote_state" "otms_ns" {
  backend = "s3"

  config = {
    bucket = "p-12-qa-bucket"
    key    = "env/qa/network skeleton/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "employee_ami" {
  filter {
    name   = "name"
    values = ["qa-otms-employee-ami"]
  }
}

data "terraform_remote_state" "frontend" {
  count   = var.enable_http_listener ? 0 : 1
  backend = "s3"

  config = {
    bucket = "p-12-qa-bucket"
    key    = "env/qa/network skeleton/terraform.tfstate"
    region = "us-east-1"
  }
}

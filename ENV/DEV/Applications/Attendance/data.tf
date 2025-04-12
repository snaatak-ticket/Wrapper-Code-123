data "terraform_remote_state" "otms_vpc" {
  backend = "s3"

  config = {
    bucket         = "otms-sprint5-bucket"
    key            = "env/qa/module/network-skeleton/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "dev-otms-tf-lock-table"
  }
}


data "aws_ami" "attendance_ami" {
  most_recent = true
  owners      = ["self"]

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
    key    = "env/qa/Applications/Frontend/terraform.tfstate"
    region = "us-east-2"
  }
}

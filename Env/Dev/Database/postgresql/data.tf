data "terraform_remote_state" "otms_vpc" {
  backend = "s3"

  config = {
    bucket         = "otms-sprint5-bucket"
    key            = "env/dev/module/network-skeleton/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "dev-otms-tf-lock-table"
  }
}


data "aws_ami" "postgresql_ami" {
  filter {
    name   = "name"
    values = ["postgresql_ami_updated"]
  }
}

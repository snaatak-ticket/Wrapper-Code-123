data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "prod-otms-bucket"
    key    = "env/dev/module/network-skeleton/terraform.tfstate"
    region = "us-east-2"
  }
}

data "aws_ami" "frontend_ami" {
  filter {
    name   = "name"
    values = ["frontend ami"]
  }
}

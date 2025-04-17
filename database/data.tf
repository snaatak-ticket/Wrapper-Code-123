# Redis AMI
data "aws_ami" "redis" {
  filter {
    name   = "name"
    values = ["Redis updated"]
  }

}

# Postgres AMI
data "aws_ami" "postgres" {
  filter {
    name   = "name"
    values = ["Postgres updated"]
  }

}

# Scylla AMI
data "aws_ami" "scylla" {
  filter {
    name   = "name"
    values = ["Scylladb ami"]
  }

}


data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "prod-otms-bucket"
    key    = "env/dev/module/network-skeleton/terraform.tfstate"
    region = "us-east-2"
  }
}


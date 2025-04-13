

data "terraform_remote_state" "otms_vpc" {
  backend = "s3"

  config = {
    bucket       = "otms-sprint5-bucket"
    key          = "env/qa/module/network-skeleton/terraform.tfstate"  
    region       = "us-east-2"
    use_lockfile = true    # here using lockfile instead of deprecated dynamodb table
  }
}

data "aws_ami" "postgresql" {
  most_recent = true   
  owners      = ["self"] 

  filter {
    name   = "name"
    values = ["dev-otms-postgresql-ami"] 
  }
}

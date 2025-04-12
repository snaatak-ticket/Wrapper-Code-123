# Reading outputs from previously deployed VPC/networking resources

data "terraform_remote_state" "otms_vpc" {
  backend = "s3"

  config = {
    bucket       = "otms-sprint5-bucket"
    key          = "env/qa/module/network-skeleton/terraform.tfstate"  #path to specific tfstate file
    region       = "us-east-2"
    use_lockfile = true    # here using lockfile instead of deprecated dynamodb table
  }
}

data "aws_ami" "postgresql" {
  most_recent = true    #  Always get the latest matching AMI
  owners      = ["self"]  #ami id from my current aws account only

  filter {
    name   = "name"
    values = ["dev-otms-postgresql-ami"] 
  }
}

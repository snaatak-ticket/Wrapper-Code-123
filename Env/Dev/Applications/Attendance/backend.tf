terraform {
  backend "s3" {
    bucket         = "p12-bucket-tfstate"
    key            = "env/dev/ASG/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-otms-tf-lock-table"
  }
}

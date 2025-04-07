terraform {
  backend "s3" {
    bucket         = "p12-otms-tf-state-bucket"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-otms-tf-lock-table"
  }
}

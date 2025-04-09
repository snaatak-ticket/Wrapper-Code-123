terraform {
  backend "s3" {
    bucket         = "p-12-qa-bucket"
    key            = "env/qa/network skeleton/terraform.tfstate"
    region         = "us-east-1"
    #dynamodb_table = "dev-otms-tf-lock-table"
    #encrypt = "true"
  }
}

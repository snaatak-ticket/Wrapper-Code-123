terraform {
  backend "s3" {
    bucket         = "prod-otms-bucket"
    key            = "env/dev/module/Infra/DB/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "otms-tf-lock-table"
  }
}

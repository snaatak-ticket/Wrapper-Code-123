terraform {
  backend "s3" {
    bucket         = "prod-otms-bucket"
    key            = "env/dev/module/Applications/Attendance/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "otms-tf-lock-table"
  }
}

number_of_instances   = "1"
instance_type         = "t2.micro"
key_name              = "devops"
device_name           = "/dev/sda1"
ebs_volume_size       = "15"
ebs_volume_type       = "gp2"
delete_on_termination = true
owner_name            = "Prashant"



route53_zone_id     = "Z0180926HOYJM9YJCLG6"
private_domain_name = "aman-dw.in"
name_prefix         = ""
aws_region          = "us-east-2"
env                 = "dev"
project_name        = "otms"
instance_name       = ["dev-otms-Redis-ec2", "dev-otms-Postgres-ec2", "dev-otms-Scylla-ec2"]

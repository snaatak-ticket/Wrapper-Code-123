########################

module "redis_ec2" {
  source                = "./ec2"
  number_of_instances   = var.number_of_instances
  ami_id                = var.aws_ami
  instance_type         = var.instance_type
  key_name              = var.key_name
  security_groups       = [data.terraform_remote_state.network.outputs.all_sg_ids.redis]
  device_name           = var.device_name
  ebs_volume_size       = var.ebs_volume_size
  ebs_volume_type       = var.ebs_volume_type
  delete_on_termination = var.delete_on_termination
  instance_name         = var.instance_name[0]
  subnet_id             = data.terraform_remote_state.network.outputs.subnet_ids.dev-otms-database-subnet

}


module "postgres_ec2" {
  source                = "./ec2"
  number_of_instances   = var.number_of_instances
  ami_id                = var.aws_ami
  instance_type         = var.instance_type
  key_name              = var.key_name
  security_groups       = [data.terraform_remote_state.network.outputs.all_sg_ids.postgresql]
  device_name           = var.device_name
  ebs_volume_size       = var.ebs_volume_size
  ebs_volume_type       = var.ebs_volume_type
  delete_on_termination = var.delete_on_termination
  instance_name         = var.instance_name[1]
  subnet_id             = data.terraform_remote_state.network.outputs.subnet_ids.dev-otms-database-subnet

}

module "scylla_ec2" {
  source                = "./ec2"
  number_of_instances   = var.number_of_instances
  ami_id                = var.aws_ami
  instance_type         = "t2.medium"
  key_name              = var.key_name
  security_groups       = [data.terraform_remote_state.network.outputs.all_sg_ids.scylla]
  device_name           = var.device_name
  ebs_volume_size       = var.ebs_volume_size
  ebs_volume_type       = var.ebs_volume_type
  delete_on_termination = var.delete_on_termination
  instance_name         = var.instance_name[2]
  subnet_id             = data.terraform_remote_state.network.outputs.subnet_ids.dev-otms-database-subnet

}

module "private_dns" {
  source              = "./PHZ"
  private_ips         = concat(module.redis_ec2.instance_private_ip, module.postgres_ec2.instance_private_ip, module.scylla_ec2.instance_private_ip)
  name_prefix         = ["redis", "postgres-db", "scylla-db"]
  route53_zone_id     = var.route53_zone_id
  private_domain_name = var.private_domain_name
}

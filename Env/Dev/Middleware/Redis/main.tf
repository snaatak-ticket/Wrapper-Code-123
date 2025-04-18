module "redis" {
  source = "git::git@github.com:snaatak-Zero-Downtime-Crew/Tf-Modules.git//Standalone-VM?ref=Prashant-SCRUM-345"

  count                 = var.number_of_instances
  project_name          = var.project_name
  instance_name         = var.instance_name
  ami_id                = data.aws_ami.redis_ami.id
  instance_type         = var.instance_type
  key_name              = var.key_name
  subnet_id             = data.terraform_remote_state.otms_vpc.outputs.subnet_ids.dev-otms-database-subnet
  security_groups       = [data.terraform_remote_state.otms_vpc.outputs.all_sg_ids.redis]
  env                   = var.env
  number_of_instances   = var.number_of_instances
  aws_region            = var.aws_region
  owner_name            = var.owner
  device_name           = var.device_name
  ebs_volume_size       = var.ebs_volume_size
  ebs_volume_type       = var.ebs_volume_type
  delete_on_termination = var.delete_on_termination
}

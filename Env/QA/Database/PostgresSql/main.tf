module "postgresql" {
  source = "git::git@github.com:snaatak-Zero-Downtime-Crew/Tf-Modules.git//Standalone-VM?ref=Prashant-SCRUM-345"  #source from git repo

  project_name        = var.project_name
  instance_name       = var.instance_name
  ami_id              = data.aws_ami.postgresql.id  # ami id used in postgres fetched form datat block
  instance_type       = var.instance_type
  key_name            = var.key_name
  owner_name          = var.owner_name
  subnet_id           = data.terraform_remote_state.otms_vpc.outputs.subnet_ids.dev-otms-database-subnet
  security_groups     = [data.terraform_remote_state.otms_vpc.outputs.all_sg_ids.postgresql]
  env                 = var.env
  number_of_instances = var.number_of_instances
  aws_region          = var.aws_region
}

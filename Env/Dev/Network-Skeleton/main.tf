module "networking_module" {
  source = "git::https://github.com/snaatak-Zero-Downtime-Crew/Tf-Modules.git//Network-Skeleton?ref=Aayush-SCRUM-343"

  # Region and environment
  region               = var.region
  env                  = var.env
  owner                = var.owner
  vpc_cidr             = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = var.instance_tenancy
  project_name         = var.project_name

  # Subnets
  subnet_names = var.subnet_names
  subnet_cidrs = var.subnet_cidrs
  subnet_azs   = var.subnet_azs

  # NAT
  Eip_Domain = var.Eip_Domain

  # Route Tables
  public_route_table    = var.public_route_table
  private_route_table   = var.private_route_table
  public_rt_cidr_block  = var.public_rt_cidr_block
  private_rt_cidr_block = var.private_rt_cidr_block
  public_subnet_indexes = var.public_subnet_indexes

  # NACL
  create_nacl = var.create_nacl
  nacl_names  = var.nacl_names
  nacl_rules  = var.nacl_rules

  #################### Security Groups ########################

  create_sg            = var.create_sg
  sg_names             = var.sg_names
  security_groups_rule = var.security_groups_rule


  # Load Balancer Configuration
  create_alb         = var.create_alb
  alb_name           = var.alb_name
  lb_internal        = var.lb_internal
  lb_tpye            = var.lb_tpye
  lb_enable_deletion = var.lb_enable_deletion

  # Route 53 Configuration
  create_route53    = var.create_route53
  cname_record_name = var.cname_record_name
  cname_record_type = var.cname_record_type
  cname_record_ttl  = var.cname_record_ttl

}

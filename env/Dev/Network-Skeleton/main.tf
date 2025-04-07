module "networking_module" {
  source = "git::git@github.com:snaatak-Zero-Downtime-Crew/Tf-Modules.git//Network-Skeleton?ref=Aayush-SCRUM-343"

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
  Eip_Domain  = var.Eip_Domain
  subnet_name = var.subnet_name #change

  # Route Tables
  public_route_table    = var.public_route_table
  private_route_table   = var.private_route_table
  public_rt_cidr_block  = var.public_rt_cidr_block
  private_rt_cidr_block = var.private_rt_cidr_block

  # NACL
  public_nacl_name      = var.public_nacl_name
  frontend_nacl_name    = var.frontend_nacl_name
  application_nacl_name = var.application_nacl_name
  database_nacl_name    = var.database_nacl_name

  # Public NACL Rules
  public_nacl_ingress_rules = var.public_nacl_ingress_rules
  public_nacl_egress_rules  = var.public_nacl_egress_rules

  # Frontend NACL Rules
  frontend_nacl_ingress_rules = var.frontend_nacl_ingress_rules
  frontend_nacl_egress_rules  = var.frontend_nacl_egress_rules

  # Application NACL Rules
  application_nacl_ingress_rules = var.application_nacl_ingress_rules
  application_nacl_egress_rules  = var.application_nacl_egress_rules

  # Database NACL Rules
  database_nacl_ingress_rules = var.database_nacl_ingress_rules
  database_nacl_egress_rules  = var.database_nacl_egress_rules


  #################### Security Groups ########################

  # OpenVPN Security Groups
  openvpn_ingress_rules = var.openvpn_ingress_rules
  openvpn_egress_rules  = var.openvpn_egress_rules
  ingress_cidr_blocks   = var.ingress_cidr_blocks
  egress_cidr_blocks    = var.egress_cidr_blocks
  openvpn_sg_name       = var.openvpn_sg_name

  # ALB Security Groups
  alb_ingress_rules = var.alb_ingress_rules
  alb_egress_rules  = var.alb_egress_rules

  resource = "alb"

  # Frontend Security Groups
  from_openvpn_ingress_rules = var.from_openvpn_ingress_rules
  from_alb_ingress_rules     = var.from_alb_ingress_rules
  frontend_egress_rules      = var.frontend_egress_rules

  frontend_sg = var.frontend_sg

  from_alb_ingress_app_rules = var.from_alb_ingress_app_rules

  # Attendance Security Groups
  attendance_egress_rules = var.attendance_egress_rules

  attendance_sg = var.attendance_sg

  # Employee Security Groups
  employee_egress_rules = var.employee_egress_rules

  employee_sg = var.employee_sg

  # Salary Security Groups
  salary_egress_rules = var.salary_egress_rules

  salary_sg = var.salary_sg

  # PostgreSQL Security Groups
  from_attendance_ingress_rules = var.from_attendance_ingress_rules
  postgresql_egress_rules       = var.postgresql_egress_rules

  psql_sg = var.psql_sg

  # Redis Security Groups
  from_attendance_to_redis_ingress_rules = var.from_attendance_to_redis_ingress_rules
  from_salary_to_redis_ingress_rules     = var.from_salary_to_redis_ingress_rules
  from_employee_to_redis_ingress_rules   = var.from_employee_to_redis_ingress_rules
  redis_egress_rules                     = var.redis_egress_rules

  redis_sg = var.redis_sg

  # Scylla Database Security Groups
  from_salary_ingress_rules   = var.from_salary_ingress_rules
  from_employee_ingress_rules = var.from_employee_ingress_rules
  scylla_egress_rules         = var.scylla_egress_rules

  scylla_sg = var.scylla_sg

  # Load Balancer Configuration
  alb_name           = var.alb_name
  lb_internal        = var.lb_internal
  lb_tpye            = var.lb_tpye
  lb_enable_deletion = var.lb_enable_deletion

  # Route 53 Configuration
  private_zone_name = var.private_zone_name
  cname_record_name = var.cname_record_name
  cname_record_type = var.cname_record_type
  cname_record_ttl  = var.cname_record_ttl

}

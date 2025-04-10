region       = "us-east-2"
project_name = "otms"
env          = "dev"
owner        = "aayush"

#################### VPC ########################

vpc_cidr             = "192.168.0.0/24"
enable_dns_support   = true
enable_dns_hostnames = true
instance_tenancy     = "default"

#################### SUBNET ########################

subnet_names = ["public", "frontend", "application", "database", "public-2"]

subnet_cidrs = ["192.168.0.0/28", "192.168.0.16/28", "192.168.0.64/27", "192.168.0.48/28", "192.168.0.32/28"]

subnet_azs = ["us-east-2a", "us-east-2a", "us-east-2a", "us-east-2a", "us-east-2b"]

#################### Route Table ########################

public_route_table    = "public"
private_route_table   = "private"
public_rt_cidr_block  = "0.0.0.0/0"
private_rt_cidr_block = "0.0.0.0/0"
public_subnet_indexes = [0, 4]

#################### NACL ########################

create_nacl = true
nacl_names  = ["public", "frontend", "application", "database"]

nacl_rules = {
  public = {
    subnet_index = [0, 4]
    ingress_rules = [
      { protocol = "-1", rule_no = 100, action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0 }
    ]
    egress_rules = [
      { protocol = "-1", rule_no = 100, action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0 }
    ]
  }

  ###### Frontend NACL ############
  frontend = {
    subnet_index = [1]
    ingress_rules = [
      { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
      { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.0/28", from_port = 80, to_port = 80 },
      { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.48/28", from_port = 80, to_port = 80 },
      { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.0/28", from_port = 3000, to_port = 3000 },
      { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1194, to_port = 1194 },
      { protocol = "tcp", rule_no = 600, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 }
    ]
    egress_rules = [
      { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
      { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 },
      { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.64/27", from_port = 8080, to_port = 8080 },
      { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 },
      { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1194, to_port = 1194 }
    ]
  }

  ###### Application NACL ############
  application = {
    subnet_index = [2]
    ingress_rules = [
      { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
      { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.16/28", from_port = 8080, to_port = 8080 },
      { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.16/28", from_port = 80, to_port = 80 },
      { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.48/28", from_port = 80, to_port = 80 },
      { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 }
    ]
    egress_rules = [
      { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
      { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.16/28", from_port = 9042, to_port = 9042 },
      { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.16/28", from_port = 6379, to_port = 6379 },
      { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.16/28", from_port = 5432, to_port = 5432 },
      { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.48/28", from_port = 1024, to_port = 65535 },
      { protocol = "tcp", rule_no = 600, action = "allow", cidr_block = "192.168.0.16/28", from_port = 1024, to_port = 65535 }
    ]
  }

  ###### Database NACL ############
  database = {
    subnet_index = [3]
    ingress_rules = [
      { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
      { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.64/27", from_port = 9042, to_port = 9042 },
      { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.64/27", from_port = 6379, to_port = 6379 },
      { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.64/27", from_port = 5432, to_port = 5432 }
    ]
    egress_rules = [
      { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
      { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.64/27", from_port = 1024, to_port = 65535 },
      { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.64/27", from_port = 8080, to_port = 8080 }
    ]
  }
}


#################### Security Groups ########################

create_sg = true
sg_names  = ["openvpn", "alb", "frontend", "attendance", "employee", "salary", "postgresql", "redis", "scylla"]

########### Openvpn Security Groups ##########
security_groups_rule = {
  openvpn = {
    name = "openvpn"
    ingress_rules = [
      { from_port = 1194, to_port = 1194, protocol = "udp", description = "Allow OpenVPN", cidr_blocks = ["0.0.0.0/0"], source_sg_names = [] },
      { from_port = 80, to_port = 80, protocol = "udp", description = "Allow OpenVPN", cidr_blocks = ["0.0.0.0/0"], source_sg_names = [] },
      { from_port = 22, to_port = 22, protocol = "udp", description = "Allow OpenVPN", cidr_blocks = ["0.0.0.0/0"], source_sg_names = [] },
      { from_port = 443, to_port = 443, protocol = "udp", description = "Allow OpenVPN", cidr_blocks = ["0.0.0.0/0"], source_sg_names = [] },
      { from_port = 943, to_port = 943, protocol = "udp", description = "Allow OpenVPN", cidr_blocks = ["0.0.0.0/0"], source_sg_names = [] },
      { from_port = 945, to_port = 945, protocol = "udp", description = "Allow OpenVPN", cidr_blocks = ["0.0.0.0/0"], source_sg_names = [] }

    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }


  ########### ALB Security Groups ##########
  alb = {
    name = "alb"
    ingress_rules = [
      { from_port = 80, to_port = 80, protocol = "tcp", description = "HTTP access", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 443, to_port = 443, protocol = "tcp", description = "HTTPS access", cidr_blocks = ["0.0.0.0/0"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  ########### Frontend Security Groups ##########
  frontend = {
    name = "frontend"
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH access from Openvpn", source_sg_names = ["openvpn"] },
      { from_port = 3000, to_port = 3000, protocol = "tcp", description = "HTTP access from ALB", source_sg_names = ["alb"] }

    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  ####### Attendance Security Groups ##########
  attendance = {
    name = "attendance"
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH access from Openvpn", source_sg_names = ["openvpn"] },
      { from_port = 8080, to_port = 8080, protocol = "tcp", description = "HTTP access from ALB", source_sg_names = ["alb"] }

    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  ####### Employee Security Groups ##########
  employee = {
    name = "employee"
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH access from Openvpn", source_sg_names = ["openvpn"] },
      { from_port = 8080, to_port = 8080, protocol = "tcp", description = "HTTP access from ALB", source_sg_names = ["alb"] }

    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  ######### Salary Security Groups ##########
  salary = {
    name = "salary"
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH access from Openvpn", source_sg_names = ["openvpn"] },
      { from_port = 8080, to_port = 8080, protocol = "tcp", description = "HTTP access from ALB", source_sg_names = ["alb"] }

    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  ######### Postgresql Security Groups ##########
  postgresql = {
    name = "postgresql"
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH access from Openvpn", source_sg_names = ["openvpn"] },
      { from_port = 5432, to_port = 5432, protocol = "tcp", description = "DB access from attendance API", source_sg_names = ["attendance"] }

    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  ######### Scylla Security Groups ##########
  scylla = {
    name = "scylla"
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH access from Openvpn", source_sg_names = ["openvpn"] },
      { from_port = 9042, to_port = 9042, protocol = "tcp", description = "DB access from salary API", source_sg_names = ["salary"] },
      { from_port = 9042, to_port = 9042, protocol = "tcp", description = "DB access employee API", source_sg_names = ["employee"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  ######### Redis Security Groups ##########
  redis = {
    name = "redis"
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH access from Openvpn", source_sg_names = ["openvpn"] },
      { from_port = 6379, to_port = 6379, protocol = "tcp", description = "DB access from salary API", source_sg_names = ["salary"] },
      { from_port = 6379, to_port = 6379, protocol = "tcp", description = "DB access from employee API", source_sg_names = ["employee"] },
      { from_port = 6379, to_port = 6379, protocol = "tcp", description = "DB access from attendance API", source_sg_names = ["attendance"] },

    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
}

#################### Application Load Balancer ########################

create_alb         = true
alb_name           = "alb"
lb_internal        = false
lb_tpye            = "application"
lb_enable_deletion = false


#################### Route 53 DNS Records ########################

create_route53    = true
cname_record_name = "employee-portal.otmservice.site"
cname_record_type = "CNAME"
cname_record_ttl  = "30"

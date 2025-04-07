# Region and environment
region               = "eu-north-1"
env                  = "dev"
owner                = "aayush"
vpc_cidr             = "192.168.0.0/24"
enable_dns_support   = true
enable_dns_hostnames = true
instance_tenancy     = "default"
project_name         = "otms"

# Subnets
subnet_names = ["public", "frontend", "application", "database", "private"]
subnet_cidrs = ["192.168.0.0/28", "192.168.0.16/28", "192.168.0.64/27", "192.168.0.48/28", "192.168.0.32/28"]
subnet_azs   = ["eu-north-1a", "eu-north-1a", "eu-north-1a", "eu-north-1a", "eu-north-1b"]

# NAT
Eip_Domain  = "vpc"
subnet_name = "dev-otms-public-subnet"

# Route Tables
public_route_table    = "public"
private_route_table   = "private"
public_rt_cidr_block  = "0.0.0.0/0"
private_rt_cidr_block = "0.0.0.0/0"

# NACL
public_nacl_name      = "public"
frontend_nacl_name    = "frontend"
application_nacl_name = "application"
database_nacl_name    = "database"

# Public NACL Rules
public_nacl_ingress_rules = [
  { protocol = "-1", rule_no = 100, action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0 }
]
public_nacl_egress_rules = [
  { protocol = "-1", rule_no = 100, action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0 }
]

# Frontend NACL Rules
frontend_nacl_ingress_rules = [
  { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
  { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.0/28", from_port = 80, to_port = 80 },
  { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.48/28", from_port = 80, to_port = 80 },
  { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.0/28", from_port = 3000, to_port = 3000 },
  { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1194, to_port = 1194 },
  { protocol = "tcp", rule_no = 600, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 }
]
frontend_nacl_egress_rules = [
  { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
  { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 },
  { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.64/27", from_port = 8080, to_port = 8080 },
  { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 },
  { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1194, to_port = 1194 }
]

# Application NACL Rules
application_nacl_ingress_rules = [
  { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
  { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.16/28", from_port = 8080, to_port = 8080 },
  { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.16/28", from_port = 80, to_port = 80 },
  { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.48/28", from_port = 80, to_port = 80 },
  { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 }
]
application_nacl_egress_rules = [
  { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
  { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.16/28", from_port = 9042, to_port = 9042 },
  { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.16/28", from_port = 6379, to_port = 6379 },
  { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.16/28", from_port = 5432, to_port = 5432 },
  { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.48/28", from_port = 1024, to_port = 65535 },
  { protocol = "tcp", rule_no = 600, action = "allow", cidr_block = "192.168.0.16/28", from_port = 1024, to_port = 65535 }
]

# Database NACL Rules
database_nacl_ingress_rules = [
  { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
  { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.64/27", from_port = 9042, to_port = 9042 },
  { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.64/27", from_port = 6379, to_port = 6379 },
  { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.64/27", from_port = 5432, to_port = 5432 }
]
database_nacl_egress_rules = [
  { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
  { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.64/27", from_port = 1024, to_port = 65535 },
  { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.64/27", from_port = 8080, to_port = 8080 }
]

#################### Security Groups ########################

# OpenVPN Security Groups
openvpn_ingress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
]
openvpn_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
]
ingress_cidr_blocks = ["0.0.0.0/0"]
egress_cidr_blocks  = ["0.0.0.0/0"]
openvpn_sg_name     = "openvpn"

# ALB Security Groups
alb_ingress_rules = [
  { from_port = 80, to_port = 80, protocol = "tcp", description = "HTTP Traffic" },
  { from_port = 443, to_port = 443, protocol = "tcp", description = "HTTPS Traffic" },
  { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound traffic" }
]
alb_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound traffic" }
]

resource = "alb"

# Frontend Security Groups
from_openvpn_ingress_rules = [
  { from_port = 22, to_port = 22, protocol = "tcp", description = "OpenVPN ssh Traffic" }
]
from_alb_ingress_rules = [
  { from_port = 3000, to_port = 3000, protocol = "tcp", description = "From OpenVPN Traffic" }
]
frontend_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
]

frontend_sg = "frontend"

from_alb_ingress_app_rules = [
  { from_port = 8080, to_port = 8080, protocol = "tcp", description = "tcp from alb" }
]

# Attendance Security Groups
attendance_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
]

attendance_sg = "attendance"

# Employee Security Groups
employee_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
]

employee_sg = "employee"

# Salary Security Groups
salary_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", description = "HTTP Traffic from ALB" }
]

salary_sg = "salary"

# PostgreSQL Security Groups
from_attendance_ingress_rules = [
  { from_port = 5432, to_port = 5432, protocol = "tcp", description = "Traffic from Attendance" }
]
postgresql_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
]

psql_sg = "postgresql"

# Redis Security Groups
from_attendance_to_redis_ingress_rules = [
  { from_port = 6379, to_port = 6379, protocol = "tcp", description = "Traffic from Attendance" }
]
from_salary_to_redis_ingress_rules = [
  { from_port = 6379, to_port = 6379, protocol = "tcp", description = "Traffic from Salary" }
]
from_employee_to_redis_ingress_rules = [
  { from_port = 6379, to_port = 6379, protocol = "tcp", description = "Traffic from Employee" }
]
redis_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
]

redis_sg = "redis"

# Scylla Database Security Groups
from_salary_ingress_rules = [
  { from_port = 9042, to_port = 9042, protocol = "tcp", description = "Traffic from Salary" }
]
from_employee_ingress_rules = [
  { from_port = 9042, to_port = 9042, protocol = "tcp", description = "Traffic from Employee" }
]
scylla_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
]

scylla_sg = "scylla"

# Load Balancer Configuration
alb_name           = "alb"
lb_internal        = true
lb_tpye            = "application"
lb_enable_deletion = false

# Route 53 Configuration
private_zone_name = "otmservice.site"
cname_record_name = "employee-portal.otmservice.site"
cname_record_type = "CNAME"
cname_record_ttl  = "30"

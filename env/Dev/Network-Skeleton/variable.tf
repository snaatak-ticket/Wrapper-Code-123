#################### VPC ########################
variable "region" {
  type        = string
  default     = "eu-north-1"
  description = "enter region name"
}
variable "env" {
  type        = string
  default     = "dev"
  description = "enter env name"
}

variable "owner" {
  type        = string
  default     = "aayush"
  description = "enter vpc owner name"
}

variable "vpc_cidr" {
  type        = string
  default     = "192.168.0.0/24"
  description = "enter vpc cidr"
}

variable "enable_dns_support" {
  type        = bool
  description = "enable dns support type"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "enable dns hostname type"
  default     = true
}

variable "instance_tenancy" {
  type        = string
  default     = "default"
  description = "vpc tenancy 'default' for shared, 'dedicated' for single-tenant hardware."
}
variable "project_name" {
  description = "Project name identifier"
  type        = string
  default     = "otms"
}

#################### SUBNET ########################


variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
  default     = ["public", "frontend", "application", "database", "private"]
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
  default     = ["192.168.0.0/28", "192.168.0.16/28", "192.168.0.64/27", "192.168.0.48/28", "192.168.0.32/28"]
}

variable "subnet_azs" {
  description = "List of availability zones for subnets"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1a", "eu-north-1a", "eu-north-1a", "eu-north-1b"]
}

#################### NAT ########################

variable "Eip_Domain" {
  type        = string
  description = "Domain for Elastic IP"
  default     = "vpc"
}



variable "subnet_name" {
  type        = string
  description = "Subnet name for NAT Gateway"
  default     = "dev-otms-public-subnet"
}

#################### Route Table ########################

variable "public_route_table" {
  type        = string
  default     = "public"
  description = "enter public route name"
}


variable "private_route_table" {
  type        = string
  default     = "private"
  description = "enter private route name"
}

variable "public_rt_cidr_block" {
  description = "cidr for route table"
  type        = string
  default     = "0.0.0.0/0"
}

variable "private_rt_cidr_block" {
  description = "cidr for privte route table"
  type        = string
  default     = "0.0.0.0/0"
}

#################### NACL ########################

variable "public_nacl_name" {
  description = "public nacl"
  type        = string
  default     = "public"
}
variable "frontend_nacl_name" {
  description = "frontend nacl"
  type        = string
  default     = "frontend"
}
variable "application_nacl_name" {
  description = "application nacl"
  type        = string
  default     = "application"
}
variable "database_nacl_name" {
  description = "database nacl"
  type        = string
  default     = "database"
}

variable "public_nacl_ingress_rules" {
  description = "Ingress rules for public NACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
  default = [
    { protocol = "-1", rule_no = 100, action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0 }
  ]
}


variable "public_nacl_egress_rules" {
  description = "Egress rules for public NACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
  default = [
    { protocol = "-1", rule_no = 100, action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0 }
  ]
}


variable "frontend_nacl_ingress_rules" {
  description = "Ingress rules for frontend NACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
  default = [
    { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
    { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.0/28", from_port = 80, to_port = 80 },
    { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.48/28", from_port = 80, to_port = 80 },
    { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.0/28", from_port = 3000, to_port = 3000 },
    { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1194, to_port = 1194 },
    { protocol = "tcp", rule_no = 600, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 }

  ]
}


variable "frontend_nacl_egress_rules" {
  description = "Egress rules for frontend NACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
  default = [
    { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
    { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 },
    { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.64/27", from_port = 8080, to_port = 8080 },
    { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 },
    { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1194, to_port = 1194 }
  ]
}


variable "application_nacl_ingress_rules" {
  description = "Ingress rules for application NACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
  default = [
    { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
    { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.16/28", from_port = 8080, to_port = 8080 },
    { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.16/28", from_port = 80, to_port = 80 },
    { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.48/28", from_port = 80, to_port = 80 },
    { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.0/28", from_port = 1024, to_port = 65535 }
  ]
}


variable "application_nacl_egress_rules" {
  description = "Egress rules for application NACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
  default = [
    { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
    { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.16/28", from_port = 9042, to_port = 9042 },
    { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.16/28", from_port = 6379, to_port = 6379 },
    { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.16/28", from_port = 5432, to_port = 5432 },
    { protocol = "tcp", rule_no = 500, action = "allow", cidr_block = "192.168.0.48/28", from_port = 1024, to_port = 65535 },
    { protocol = "tcp", rule_no = 600, action = "allow", cidr_block = "192.168.0.16/28", from_port = 1024, to_port = 65535 }
  ]
}


variable "database_nacl_ingress_rules" {
  description = "Ingress rules for database NACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
  default = [
    { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
    { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.64/27", from_port = 9042, to_port = 9042 },
    { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.64/27", from_port = 6379, to_port = 6379 },
    { protocol = "tcp", rule_no = 400, action = "allow", cidr_block = "192.168.0.64/27", from_port = 5432, to_port = 5432 }
  ]
}


variable "database_nacl_egress_rules" {
  description = "Egress rules for database NACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
  default = [
    { protocol = "tcp", rule_no = 100, action = "allow", cidr_block = "192.168.0.0/28", from_port = 22, to_port = 22 },
    { protocol = "tcp", rule_no = 200, action = "allow", cidr_block = "192.168.0.64/27", from_port = 1024, to_port = 65535 },
    { protocol = "tcp", rule_no = 300, action = "allow", cidr_block = "192.168.0.64/27", from_port = 8080, to_port = 8080 }
  ]
}

#################### Security Groups ########################
#openvpn_security_groups

variable "openvpn_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}
variable "openvpn_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of CIDR blocks for egress rules"
}

variable "egress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of CIDR blocks for egress rules"
}

variable "openvpn_sg_name" {
  type        = string
  default     = "openvpn"
  description = "enter open vpn name"
}



#alb_security_groups

variable "alb_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 80, to_port = 80, protocol = "tcp", description = "HTTP Traffic" },
    { from_port = 443, to_port = 443, protocol = "tcp", description = "HTTPS Traffic" },
    { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound traffic" }
  ]
}
variable "alb_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound traffic" }
  ]
}

variable "resource" {
  type        = string
  default     = "alb"
  description = "enter alb sg name"
}


#frontend_security_groups

variable "from_openvpn_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 22, to_port = 22, protocol = "tcp", description = "OpenVPN ssh Traffic" }
  ]
}

variable "from_alb_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 3000, to_port = 3000, protocol = "tcp", description = "From OpenVPN  Traffic" },

  ]
}

variable "frontend_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}

variable "frontend_sg" {
  type        = string
  default     = "frontend"
  description = "enter alb sg name"
}

variable "from_alb_ingress_app_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 8080, to_port = 8080, protocol = "tcp", description = "tcp from alb" }
  ]
}


variable "attendance_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}

variable "attendance_sg" {
  type        = string
  default     = "attendance"
  description = "enter alb sg name"
}


variable "employee_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}

variable "employee_sg" {
  type        = string
  default     = "employee"
  description = "enter employee sg name"
}

variable "salary_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "HTTP Traffic from ALB" }
  ]
}


variable "salary_sg" {
  type        = string
  default     = "salary"
  description = "enter alb sg name"
}


#postgresql_security_groups

variable "from_attendance_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 5432, to_port = 5432, protocol = "tcp", description = "Traffic from Attendance" },
  ]
}


variable "postgresql_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}

variable "psql_sg" {
  type        = string
  default     = "postgresql"
  description = "enter postgresql sg name"
}


#redis_security_groups



variable "from_attendance_to_redis_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 6379, to_port = 6379, protocol = "tcp", description = "Traffic from Attendance" },
  ]
}

variable "from_salary_to_redis_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 6379, to_port = 6379, protocol = "tcp", description = "Traffic from salary" },
  ]
}

variable "from_employee_to_redis_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 6379, to_port = 6379, protocol = "tcp", description = "Traffic from employee" },
  ]
}


variable "redis_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}


variable "redis_sg" {
  type        = string
  default     = "redis"
  description = "enter redis sg name"
}

#scylla Database

variable "from_salary_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 9042, to_port = 9042, protocol = "tcp", description = "Traffic from salary" },
  ]
}

variable "from_employee_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 9042, to_port = 9042, protocol = "tcp", description = "Traffic from employee" },
  ]
}


variable "scylla_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))

  default = [
    { from_port = 0, to_port = 0, protocol = "-1", description = "All Inbound" }
  ]
}

variable "scylla_sg" {
  type        = string
  default     = "scylla"
  description = "enter scylla sg name"
}

variable "alb_name" {
  type        = string
  default     = "alb"
  description = "enter load balancer name"
}
variable "lb_internal" {
  type        = bool
  default     = true
  description = "enter load balancer internal"
}
variable "lb_tpye" {
  type        = string
  default     = "application"
  description = "enter load balancer type"
}

variable "lb_enable_deletion" {
  type        = bool
  default     = false
  description = "enter load balancer enable deletion protection"
}

## Route 53 
variable "private_zone_name" {
  description = "The name of the private Route53 hosted zone where DNS records will be created"
  type        = string
  default     = "otmservice.site"
}

variable "cname_record_name" {
  description = "The name/subdomain for the CNAME record (e.g., 'api' for api.example.com)"
  type        = string
  default     = "employee-portal.otmservice.site"
}

variable "cname_record_type" {
  description = "The DNS record type - should typically be 'CNAME' for canonical name records"
  type        = string
  default     = "CNAME"
}

variable "cname_record_ttl" {
  description = "Time-to-live (TTL) value for the DNS record in seconds. Controls how long DNS resolvers cache the record."
  type        = string
  default     = "30"
}


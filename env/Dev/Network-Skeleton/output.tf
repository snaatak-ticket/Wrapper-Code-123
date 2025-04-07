output "vpc_id" {
  value       = module.networking_module.vpc_id
  description = "id of the otms vpc "
}

output "subnet_ids" {
  value       = module.networking_module.subnet_ids
  description = "Map of subnet names to subnet IDs"
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = module.networking_module.igw_id
}

output "NAT_Gateway" {
  value = module.networking_module.NAT_Gateway
}

output "public_rt_id" {
  value = module.networking_module.public_rt_id
}

output "privat_rt_id" {
  value = module.networking_module.privat_rt_id
}

#openvpn_security_groups

output "openvpn_sg_id" {
  value       = module.networking_module.openvpn_sg_id
  description = "id of the private security group "
}


#alb_security_groups
output "alb_sg_id" {
  value       = module.networking_module.alb_sg_id
  description = "id of the private security group "
}

#frontend_security_groups

output "frontend_sg_id" {
  value       = module.networking_module.frontend_sg_id
  description = "id of the salary security group "
}

#attendance_security_groups

output "attendance_sg_id" {
  value       = module.networking_module.attendance_sg_id
  description = "id of the private security group "
}

#employee_security_groups

#salary_security_groups
output "salary_sg_id" {
  value       = module.networking_module.salary_sg_id
  description = "id of the salary security group "
}

#postgresql_security_groups

output "postgresql_sg_id" {
  value       = module.networking_module.postgresql_sg_id
  description = "id of the postgresql security group"
}

#redis_security_groups

output "redis_sg_id" {
  value       = module.networking_module.redis_sg_id
  description = "id of the redis security group"
}


#scylla Database

output "scylla_sg_id" {
  value       = module.networking_module.scylla_sg_id
  description = "id of the scylla security group"
}

#Application Load Balancer

output "alb_arn" {
  value       = module.networking_module.alb_arn
  description = "id of the alb"
}

output "alb_dns" {
  value       = module.networking_module.alb_dns
  description = "id of the alb"
}

# Route 53 

output "aws_route53_zone_id" {
  value = module.networking_module.aws_route53_zone_id
}

output "cname_record_id" {
  value = module.networking_module.cname_record_id
}

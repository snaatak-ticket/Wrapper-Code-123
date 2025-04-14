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

output "all_sg_ids" {
  value = module.networking_module.all_sg_ids
}

#Application Load Balancer

output "alb_arn" {
  value       = module.networking_module.alb_arn
  description = "arn of the alb"
}

output "alb_dns" {
  value       = module.networking_module.alb_dns
  description = "DNS of the alb"
}


output "redis_instance_public_ips" {
  description = "Public IPs of Redis EC2 instances"
  value       = module.redis_ec2.instance_public_ip
}

output "redis_instance_private_ips" {
  description = "Private IPs of Redis EC2 instances"
  value       = module.redis_ec2.instance_private_ip
}

output "redis_instance_ids" {
  description = "Instance IDs of Redis EC2 instances"
  value       = module.redis_ec2.instance_id
}

output "postgres_instance_public_ips" {
  description = "Public IPs of PostgreSQL EC2 instances"
  value       = module.postgres_ec2.instance_public_ip
}

output "postgres_instance_private_ips" {
  description = "Private IPs of PostgreSQL EC2 instances"
  value       = module.postgres_ec2.instance_private_ip
}

output "postgres_instance_ids" {
  description = "Instance IDs of PostgreSQL EC2 instances"
  value       = module.postgres_ec2.instance_id
}

output "scylla_instance_public_ips" {
  description = "Public IPs of Scylla EC2 instances"
  value       = module.scylla_ec2.instance_public_ip
}

output "scylla_instance_private_ips" {
  description = "Private IPs of Scylla EC2 instances"
  value       = module.scylla_ec2.instance_private_ip
}

output "scylla_instance_ids" {
  description = "Instance IDs of Scylla EC2 instances"
  value       = module.scylla_ec2.instance_id
}

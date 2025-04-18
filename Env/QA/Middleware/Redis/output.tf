output "instance_public_ip" {
  description = "Public IPs of the redis EC2 instances"
  value       = module.redis[*].instance_public_ip
}

output "instance_private_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.redis[*].instance_private_ip
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.redis[*].instance_id
}


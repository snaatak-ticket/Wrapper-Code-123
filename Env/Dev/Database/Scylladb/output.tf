output "instance_public_ip" {
  description = "Public IPs of the ScyllaDB EC2 instances"
  value       = module.scylladb[*].instance_public_ip
}

output "instance_private_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.scylladb[*].instance_private_ip
}
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.scylladb[*].instance_id
}

resource "aws_instance" "Ec2-Instance" {
  count           = var.number_of_instances
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  security_groups = var.security_groups

  ebs_block_device {
    device_name           = var.device_name
    volume_size           = var.ebs_volume_size
    volume_type           = var.ebs_volume_type
    delete_on_termination = var.delete_on_termination
  }

  tags = {
    Name = var.instance_name
  }
}

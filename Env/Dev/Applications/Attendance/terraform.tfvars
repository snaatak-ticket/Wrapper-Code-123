template_name = "dev-otms-lt"
#ami_id = "ami-0b1eadfb4d2c7c6c7"
instance_type = "t2.micro"
key_name = "samrat"
# subnet_id = "subnet-0529141bab235cf03"
# security_group_id = "sg-07cc452e0b2b8724c"

common_tags = {
  Project = "dev-otms"
  Owner = "Aman"
}

asg_name  = "dev-otms-attendance-asg"
desired_capacity = 1
max_size  = 4
min_size  = 1
target_group_arn   = null
launch_template_id = null
environment    = "dev"
owner = "Aman"

listener_arn = null
priority = 4
alb_listener_action = "forward"
path_pattern = "/app/v1/attendance/*"
rule_name = "dev-otms-attendance-lr"
env = "dev"

asg_policy_name = "scale-policy"
asg_policy_type = "TargetTrackingScaling"
estimated_instance_warmup = 300
predefined_metric_type = "ASGAverageCPUUtilization"
asg_policy_target_value = 50.0
enable_asg_policy  = true
step_adjustment_type = "ChangeInCapacity"
step_metric_interval_lower_bound = 0
step_scaling_adjustment = 1

name = "dev-otms-attendance-tg"
port = 8080
protocol = "HTTP"
target_type = "instance"
#vpc_id  = "vpc-0d257991ebfa1066b"

health_check_interval = 30
health_check_path = "/health"
health_check_protocol = "HTTP"
health_check_timeout = 5
healthy_threshold = 2
unhealthy_threshold = 2
#alb_arn = "arn:aws:elasticloadbalancing:us-east-1:774305612120:loadbalancer/app/dev-otms-alb/2f3b68daf8f22343"

tags = {
  Name  = "dev-otms-attendance-tg"
  Env   = "dev"
  Owner = "aman"
}

region = "us-east-2"
template_name    = "dev-otms-attendance-lt"
instance_type    = "t2.micro"
key_name         = "otms_dev"
env              = "dev"
owner            = "Aman"
project_name     = "otms"
application_name = "attendance"

asg_name           = "dev-otms-attendance-asg"
desired_capacity   = 1
max_size           = 4
min_size           = 1
target_group_arn   = null
launch_template_id = null
lt_version         = "$Latest"

priority            = 4
alb_listener_action = "forward"
path_pattern        = "/app/v1/attendance/*"
rule_name           = "dev-otms-attendance-lr"


asg_policy_name                  = "scale-policy"
asg_policy_type                  = "TargetTrackingScaling"
estimated_instance_warmup        = 300
predefined_metric_type           = "ASGAverageCPUUtilization"
asg_policy_target_value          = 50.0
enable_asg_policy                = true
step_adjustment_type             = "ChangeInCapacity"
step_metric_interval_lower_bound = 0
step_scaling_adjustment          = 1

tg_name     = "dev-otms-attendance-tg"
port        = 8080
protocol    = "HTTP"
target_type = "instance"

health_check_interval = 30
health_check_path     = "/health"
health_check_protocol = "HTTP"
health_check_timeout  = 5
healthy_threshold     = 2
unhealthy_threshold   = 2
enable_http_listener  = false
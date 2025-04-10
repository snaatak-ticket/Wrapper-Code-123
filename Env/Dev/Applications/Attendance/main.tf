module "asg" {
  # source = "git::git@github.com:snaatak-Zero-Downtime-Crew/Tf-Modules.git//ASG?ref=Aman-SCRUM-344"
  source            = "../../../../../ASG"
  region            = var.region
  template_name     = var.template_name
  ami_id            = data.aws_ami.attendance_ami.id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = data.terraform_remote_state.otms_vpc.outputs.subnet_ids.dev-otms-application-subnet
  security_group_id = data.terraform_remote_state.otms_vpc.outputs.all_sg_ids.attendance
  lt_tags           = local.lt_tags

  tg_tags            = local.tg_tags
  asg_name           = var.asg_name
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  target_group_arn   = var.target_group_arn
  launch_template_id = var.launch_template_id
  lt_version         = var.lt_version
  asg_tags           = local.asg_tags

  listener_arn        = var.listener_arn
  priority            = var.priority
  alb_listener_action = var.alb_listener_action
  path_pattern        = var.path_pattern
  lr_tags             = local.lr_tags
  enable_http_listener = var.enable_http_listener

  asg_policy_name                  = var.asg_policy_name
  asg_policy_type                  = var.asg_policy_type
  estimated_instance_warmup        = var.estimated_instance_warmup
  predefined_metric_type           = var.predefined_metric_type
  asg_policy_target_value          = var.asg_policy_target_value
  enable_asg_policy                = var.enable_asg_policy
  step_adjustment_type             = var.step_adjustment_type
  step_metric_interval_lower_bound = var.step_metric_interval_lower_bound
  step_scaling_adjustment          = var.step_scaling_adjustment

  tg_name               = var.tg_name
  port                  = var.port
  protocol              = var.protocol
  target_type           = var.target_type
  vpc_id                = data.terraform_remote_state.otms_vpc.outputs.vpc_id
  health_check_interval = var.health_check_interval
  health_check_path     = var.health_check_path
  health_check_protocol = var.health_check_protocol
  health_check_timeout  = var.health_check_timeout
  healthy_threshold     = var.healthy_threshold
  unhealthy_threshold   = var.unhealthy_threshold
  alb_arn               = data.terraform_remote_state.otms_vpc.outputs.alb_arn
}

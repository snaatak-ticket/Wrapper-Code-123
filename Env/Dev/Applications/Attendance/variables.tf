variable "template_name" {
  description = "Name of LT"
  type        = string
}
variable "env" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}

variable "owner" {
  description = "Owner tag"
  type        = string
}

variable "project_name" {
  description = "name of project"
  type        = string
}

variable "application_name" {
  description = "name of application"
  type        = string
}

variable "instance_type" {
  description = "Instance size"
  type        = string
}

variable "key_name" {
  description = "Key Pair name"
  type        = string
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
}

variable "lt_version" {
  description = "varsion for lt in asg"
  type        = string
}
variable "target_group_arn" {
  description = "Optional: ARN of an existing target group"
  type        = string
  default     = null
}

variable "launch_template_id" {
  description = "Optional: Launch Template ID to use"
  type        = string
  default     = null
}

# variable "listener_arn" {
#   description = "ARN of the ALB listener"
#   type        = string
# }

variable "priority" {
  description = "Priority of the listener rule"
  type        = number
}

variable "alb_listener_action" {
  description = "Type of action (e.g., forward)"
  type        = string
  default     = "forward"
}

variable "path_pattern" {
  description = "Path pattern for routing"
  type        = string
}

variable "rule_name" {
  description = "Name of the listener rule"
  type        = string
}

variable "asg_policy_name" {
  description = "Custom name for the scaling policy"
  type        = string
}

variable "asg_policy_type" {
  description = "Policy type for ASG"
  type        = string
  default     = "TargetTrackingScaling"
}

variable "estimated_instance_warmup" {
  description = "Warm-up time for instances"
  type        = number
  default     = 300
}

variable "predefined_metric_type" {
  description = "Metric type for scaling"
  type        = string
  default     = "ASGAverageCPUUtilization"
}

variable "asg_policy_target_value" {
  description = "Target value for the metric"
  type        = number
}

variable "enable_asg_policy" {
  description = "Enable creation of the ASG policy"
  type        = bool
  default     = false
}

variable "step_adjustment_type" {
  description = "Adjustment type for step scaling"
  type        = string
  default     = "ChangeInCapacity"
}

variable "step_metric_interval_lower_bound" {
  description = "Lower bound of metric interval"
  type        = number
  default     = 0
}

variable "step_scaling_adjustment" {
  description = "Scaling adjustment for step scaling"
  type        = number
  default     = 1
}

variable "tg_name" {
  description = "Name of the target group"
  type        = string
}

variable "port" {
  description = "Port for target group"
  type        = number
}

variable "protocol" {
  description = "Protocol for target group"
  type        = string
}

variable "target_type" {
  description = "Target type (instance, ip, lambda)"
  type        = string
}

variable "health_check_interval" {
  description = "Time between health checks"
  type        = number
}

variable "health_check_path" {
  description = "Path for HTTP health checks"
  type        = string
}

variable "health_check_protocol" {
  description = "Protocol for health checks"
  type        = string
}

variable "health_check_timeout" {
  description = "Time to wait for health check response"
  type        = number
}

variable "healthy_threshold" {
  description = "Number of successes before healthy"
  type        = number
}

variable "unhealthy_threshold" {
  description = "Number of failures before unhealthy"
  type        = number
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "enter region name"
}

variable "enable_http_listener" {
  description = "pass this as 1 only in case of frontend"
  type = bool
}
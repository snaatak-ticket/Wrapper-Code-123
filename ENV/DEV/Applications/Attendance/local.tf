locals {
  common_tags = {
    env   = var.env
    owner = var.owner
  }

  lt_tags = merge(local.common_tags, {
    Name = "${var.env}-${var.project_name}-${var.application_name}"
  })

  asg_tags = [
    for tag_key, tag_value in local.common_tags : {
      key                 = tag_key
      value               = tostring(tag_value)
      propagate_at_launch = true
    }
  ]

  tg_tags = merge(local.common_tags, {
    Name = "${var.env}-${var.project_name}-${var.application_name}-tg"
  })

  lr_tags = merge(local.common_tags, {
    Name = "${var.env}-${var.project_name}-${var.application_name}-lr"
  })

  listener_arn = var.enable_http_listener ? null : data.terraform_remote_state.frontend[0].outputs.alb_lr_arn

}

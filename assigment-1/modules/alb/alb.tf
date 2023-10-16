resource "aws_lb" "alb" {
  
  count                            = var.create_elb ? 1 : 0
  name                             = "alb-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.custom_name}"
  internal                         = var.internal
  load_balancer_type               = var.load_balancer_type
  subnets                          = var.subnet_id
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  security_groups                  = var.security_groups
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2
  enable_waf_fail_open             = var.enable_waf_fail_open
  idle_timeout                     = var.idle_timeout
  preserve_host_header             = var.preserve_host_header
  desync_mitigation_mode           = var.desync_mitigation_mode
  drop_invalid_header_fields       = var.drop_invalid_header_fields
   

  access_logs {
    enabled = var.logging_enabled
    bucket  = var.log_bucket_name
    prefix  = var.log_bucket_prefix
  }
  tags = {
    "tier" = var.tier
    "zone" = var.zone
  }
}

resource "aws_lb_target_group" "target_grp" {
  count            = var.create_elb ? 1 : 0
  name             = "tg-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.custom_name}-dft"
  vpc_id           = var.vpc_id
  port             = var.alb_port
  protocol         = var.alb_protocol 
  target_type      = var.target_type
  ip_address_type  = var.ip_address_type

  connection_termination 	           =  var.connection_termination
  deregistration_delay               = var.deregistration_delay
  slow_start                         = var.slow_start 
  proxy_protocol_v2                  = var.proxy_protocol_v2 
   

  health_check {
      enabled             = var.alb_hc_enabled
      interval            = var.alb_hc_interval
      path                = var.alb_hc_path
      port                = var.alb_hc_port
      healthy_threshold   = var.alb_hc_healthy_threshold
      unhealthy_threshold = var.alb_hc_unhealthy_threshold
      timeout             = var.alb_hc_timeout
      protocol            = var.alb_hc_protocol
      
    }
  stickiness {
    enabled         = var.enable-stickiness
    type            = var.stickiness-type
    cookie_duration = var.cookie_duration
  }
    tags = {
    "tier" = var.tier
    "zone" = var.zone
  }
}

resource "aws_lb_listener" "listener" {
	# checkov:skip=CKV_AWS_2: ADD REASON
	count             = var.create_elb ? 1 : 0
  load_balancer_arn = aws_lb.alb[0].arn
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol
  default_action {
    type             = var.default_action_type
    target_group_arn = aws_lb_target_group.target_grp[0].arn
  }
  tags = {
    "tier" = var.tier
    "zone" = var.zone
  }
}

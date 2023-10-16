output "alb_arn" {
    value = var.create_elb ? aws_lb.alb[0].arn : null
  
}

output "alb_dns_name" {
    value =  var.create_elb ? aws_lb.alb[0].dns_name : null
  
}

output "alb_zone_id" {
    value =  var.create_elb ? aws_lb.alb[0].zone_id : null
  
}

output "alb_tg_arn" {
    value =  var.create_elb ? aws_lb_target_group.target_grp[0].arn : null
  
}
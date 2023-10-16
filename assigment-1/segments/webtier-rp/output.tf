output "autoscaling_group_name" {
  description = "The ID of the autoscaling_group_name"
  value       = module.aws_asg.autoscaling_group_name
}

output "subnet_id_1" {
  description = "The ID of the private subnet"
  value       = module.private_subnet.subnet_id_1
}
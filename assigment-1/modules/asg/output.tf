################################################################################
# Launch template
################################################################################

output "launch_template_id" {
  description = "The ID of the launch template"
  value       = try(aws_launch_template.launch_template.id, "")
}

output "launch_template_arn" {
  description = "The ARN of the launch template"
  value       = try(aws_launch_template.launch_template.arn, "")
}

output "launch_template_name" {
  description = "The name of the launch template"
  value       = try(aws_launch_template.launch_template.name, "")
}

output "launch_template_latest_version" {
  description = "The latest version of the launch template"
  value       = try(aws_launch_template.launch_template.latest_version, "")
}

output "launch_template_default_version" {
  description = "The default version of the launch template"
  value       = try(aws_launch_template.launch_template.default_version, "")
}

################################################################################
# Autoscaling group
################################################################################

output "autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = try(aws_autoscaling_group.auto_scaling_group.id, "")
}

output "autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = try(aws_autoscaling_group.auto_scaling_group.name, "")
}

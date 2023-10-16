output "write_parameter_name" {
    description = "The ARN of the parameter."
    value = [for k in aws_ssm_parameter.aws_parameter_write : k.name]
}

output "write_parameter_arn" {
    description = "The ARN of the parameter."
    value = [for k in aws_ssm_parameter.aws_parameter_write : k.arn]
}

output "write_parameter_id" {
    description = "The ARN of the parameter."
    value = [for k in aws_ssm_parameter.aws_parameter_write : k.id]
}
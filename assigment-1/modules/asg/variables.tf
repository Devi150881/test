variable "project_code" {
  type = string
}
variable "environment" {
  type = string
}
variable "tier" {
  type = string
}
variable "zone" {
  type = string
}

variable "desired_capacity" {
  type = number
}

variable "max_size" {
   type = number
}

variable "min_size" {
   type = number
}

variable "health_check_grace_period" {
  type = number
}
variable "health_check_type" {
  type = string
}

variable "aws_alb_target_group_arn" {
  type = list(string)
}

variable "strategy" {
   type = string
}

variable "ec2_role" {
   type = string
}

variable "min_healthy_percentage" {
  type = number
}

variable "autoscaling_enabled" {
  type = bool
}

variable "heartbeat_timeout" {
  type = number
}

variable "folder_name" {
  type = string
}

variable "s3_path" {
  type = string
}

variable "instance_initiated_shutdown_behavior" {
  description = "provide the behavior"
  type        = string

}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "vpc_zone_identifier"
}

variable "vm_security_group_ids" {
  type        = list(string)
  description = "vm_security_group_ids"
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "aws_key_pair" {
  type = string
}

variable "enable_monitoring" {
  type = bool
}
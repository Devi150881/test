variable "aws_region" {
  type = string
  default = "ap-southeast-1"
}


############################ common variable
variable "vpc_id" {
  type = string
}

variable "security_group_rules_alb" {
  default = {}
}
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
variable "create_method" {
  type = string
}
variable "agency_code" {
  type = string
}

###########ALB############

variable "public_subnet_ids" {
  type = list(string)
}
variable "alb_name" {
  type = string
}
#######WEB-SER######
variable "security_group_rules_web" {
  default = {}
}

variable "web_server_name" {
  type = string
}

variable "folder_name" {
  type = string
}

variable "file_name_iamrole" {
  type = string
}

variable "file_name_iampolicy" {
  type = string
}

variable "file_name_sm" {
  type = string
}

variable "managed_policy_arns" {
  description = " Set of exclusive IAM managed policy ARNs to attach to the IAM role"
  type        = list(string)
  default     = null
}

variable "create_policy_attachment" {
  description = "DO we need to attach policy"
  type        = bool
  default     = false
}

variable "permissions_boundary" {
  type        = string
  description = "ARN of the policy that is used to set the permissions boundary for the role"
  default     = ""
}

variable "sm_kms_key_arn" {
  type        = string
  default     = null
  description = "Customer Master Key Id to be used to encrypt the secrets values"
}

variable "recovery_window_in_days" {
  type        = number
  default     = 10
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret"
}

variable "rotation_lambda_arn" {
  type        = string
  default     = null
  description = "Lambda ARN"
}

variable "rotation" {
  type    = bool
  default = true
}

variable "create_role_policy_attachment" {
  description = "DO we need to attach policy"
  type        = bool
  default     = true
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "enter secret name for which will be created for"
}

variable "availability_zones" {
  type        = list(string)
  description = "enter secret name for which will be created for"
}

variable "enable_monitoring" {
  type = bool
  default = false
}

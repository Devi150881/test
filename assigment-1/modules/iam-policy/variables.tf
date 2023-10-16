variable "project_code" {
  description = "Provide the Project code"
  type        = string
}

variable "environment" {
  type        = string
  description = <<EOT
    (Optional)  The name of the environment where the resources will be deployed.
 
    Options:
      - dev
      - uat
      - stg
      - prd
      - dso
      - mgt
 
    Default: dev
  EOT

  default = "dev"
}

variable "zone" {
  description = "Provide the Zone name"
  type        = string
  default     = null
}

variable "tier" {
  description = "Provide the Tier name"
  type        = string
  default     = null
}



variable "file_name" {
  description = "Provide the name of Policy File"
  type        = string

}

variable "service_name" {
  description = "Provide the name of service which will use this role"
  type        = string

}

variable "description" {
  description = "Provide the description for this role"
  type        = string

}

variable "folder_name" {
  description = "Provide the name of folder where the policy is kept"
  type        = string
}

variable "users" {
  description = "Provide the list of users who needs to this policy"
  type        = list(string)
  default     = []
}

variable "roles" {
  description = "Provide the role name where this policy needs to be attached"
  type        = list(string)
  default     = []
}

variable "groups" {
  description = "Provide the name of groups where this policy needs to be mapped"
  type        = list(string)
  default     = []
}

variable "create_policy_attachment" {
  description = "DO we need to attach policy"
  type        = bool
  default     = false
}

variable "create_role_policy_attachment" {
  description = "DO we need to attach policy"
  type        = bool
  default     = true
}

variable "create_user_policy_attachment" {
  description = "DO we need to attach policy"
  type        = bool
  default     = false
}

variable "create_group_policy_attachment" {
  description = "DO we need to attach policy"
  type        = bool
  default     = false
}

variable "user_name" {
  description = "Provide the list of users who needs to this policy"
  type        = string
  default     = null
}

variable "role_name" {
  description = "Provide the role name where this policy needs to be attached"
  type        = string
  default     = null
}

variable "group_name" {
  description = "Provide the name of groups where this policy needs to be mapped"
  type        = string
  default     = null
}
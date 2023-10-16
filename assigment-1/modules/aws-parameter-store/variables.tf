

variable "project_code" {
  description = "Provide the project code"
  type = string
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
  description = "Specify the zone name for the resources"
  type = string
}

variable "tier" {
  description = "Specify the zone name for the resources"
  type = string
}

variable "kms_id" {
  description = "specify the KMS_id"
  type = string
}

variable "aws_parameter_write" {
  description = "Parameter details"
    type        = list(object({
    name = string
    value   = string
    type  = string
    overwrite = string
    param_tier = string
  }))
}
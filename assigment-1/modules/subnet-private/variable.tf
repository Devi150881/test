variable "vpc_id" {
  type        = string
  description = "enter tier details"
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "enter secret name for which will be created for"
}

variable "availability_zones" {
  type        = list(string)
  description = "enter secret name for which will be created for"
}

variable "environment" {
  type        = string
  description = "enter deatils of env "
}
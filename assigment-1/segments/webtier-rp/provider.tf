provider "aws" {
  region = "ap-southeast-1"
  profile = "default"
  /*
  assume_role {
     role_arn = var.cross-account-assume_role_arn
   }*/
  default_tags {
    tags = {
      Project-code  = var.project_code
      Environment   = var.environment
      Zone          = var.zone
      Tier          = var.tier
      Agency-code   = var.agency_code
      Create-method = var.create_method
    }
  }
}

##backend config
/*
terraform {
  backend "s3" {
    region = "ap-southeast-1"
  }
}

data "terraform_remote_state" "dmz_internet_vpc" {
  backend = "s3"

 config = {
   region = "ap-southeast-1"
   bucket = var.dmz_internet_vpc_remote_bucket
   key    = var.dmz_internet_vpc_remote_state 
 }
}


resource "aws_ssm_parameter" "hostname_rp_count" {
  name = "param-${var.project_code}-${var.environment}${var.zone}${var.tier}-rp-hostname-count"
  description = "Required to create unique hostname"
  type        = "String"
  value       = 0
}*/
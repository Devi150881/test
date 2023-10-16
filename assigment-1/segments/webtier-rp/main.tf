
locals {
  secret_string = {
    "key" : module.keypair_web_server.private_key_pem
  }
}

module "security_group_alb" {
  source               = "../../modules/security-group"
  project_code         = var.project_code
  environment          = var.environment
  zone                 = var.zone
  tier                 = var.tier
  function_name        = var.alb_name
  security_group_rules = var.security_group_rules_alb
  vpc_id               = var.vpc_id
}

module "aws_alb" {
  source                           = "../../modules/alb"
  environment                      = var.environment
  project_code                     = var.project_code
  tier                             = var.tier
  zone                             = var.zone
  subnet_id                        = var.public_subnet_ids
  security_groups                  = [module.security_group_alb.out_sg_id]
  vpc_id                           = var.vpc_id
  custom_name                      = var.alb_name
}


module "security_group_web_server" {
  source               = "../../modules/security-group"
  project_code         = var.project_code
  environment          = var.environment
  zone                 = var.zone
  tier                 = var.tier
  function_name        = var.web_server_name
  security_group_rules = var.security_group_rules_web
  vpc_id               = var.vpc_id
}

module "aws_iam_policy_web_server" {
  source                        = "../../modules/iam-policy"
  description                   = "IAM policy for the odi ec2 role"
  project_code                  = var.project_code
  environment                   = var.environment
  zone                          = var.zone
  tier                          = var.tier
  service_name                  = var.web_server_name
  folder_name                   = var.folder_name
  file_name                     = var.file_name_iampolicy
  role_name                     = module.aws_iam_role_web_server.role_name
  create_role_policy_attachment = var.create_role_policy_attachment
}

module "aws_iam_role_web_server" {
  source               = "../../modules/iam-assume-role"
  description          = "IAM role for odi EC2 instance"
  project_code         = var.project_code
  environment          = var.environment
  zone                 = var.zone
  tier                 = var.tier
  service_name         = var.web_server_name
  managed_policy_arns  = var.managed_policy_arns
  permissions_boundary = var.permissions_boundary
  folder_name          = var.folder_name
  file_name            = var.file_name_iamrole
}



module "keypair_web_server" {
  source       = "../../modules/keypair"
  tier         = var.tier
  zone         = var.zone
  project_code = var.project_code
  keypair_name = var.web_server_name
  algorithim   = "RSA"
  rsa_bits     = 4096
}

module "secret_manager_web_server" {
  source                  = "../../modules/secrets-manager"
  description             = "secret for odi server" 
  project_code            = var.project_code
  environment             = var.environment
  tier                    = var.tier
  zone                    = var.zone
  kms_key_arn             = var.sm_kms_key_arn
  recovery_window_in_days = var.recovery_window_in_days
  name                    = join("-",[var.web_server_name,"01"])
  rotation                = var.rotation
  rotation_lambda_arn     = var.rotation_lambda_arn
  secret_string           = local.secret_string
  file_name               = var.file_name_sm
  folder_name             = var.folder_name
}

module "private_subnet" {
  environment          = var.environment
  source               = "../../modules/subnet-private"
  availability_zones   = var.availability_zones
  private_subnets_cidr = var.private_subnets_cidr
  vpc_id               = var.vpc_id
}

module "aws_asg" {
  source                           = "../../modules/asg"
  autoscaling_enabled              = true
  environment                      = var.environment
  project_code                     = var.project_code
  tier                             = var.tier
  zone                             = var.zone
  ec2_role                         = module.aws_iam_role_web_server.role_name
  vpc_zone_identifier              = [module.private_subnet.subnet_id_1]
  desired_capacity                 = 1
  max_size                         = 1
  min_size                         = 1
  health_check_grace_period        = 300
  health_check_type                = "ELB"
  aws_alb_target_group_arn         = [module.aws_alb.alb_tg_arn]
  strategy                         = "Rolling"
  min_healthy_percentage           = 50
  heartbeat_timeout                = 2000
  s3_path                          = "s3://devi150881/index.html"
  folder_name                      = var.folder_name
  image_id                        = "ami-0fa7190e664488b99"
  instance_type                   = "t2.micro"
  instance_initiated_shutdown_behavior = "terminate"
  vm_security_group_ids           = [module.security_group_web_server.out_sg_id]
  aws_key_pair                    = module.keypair_web_server.keypair_name
  enable_monitoring               = var.enable_monitoring
}

resource "aws_eip" "nat_eip" {
  vpc        = true
}
/* NAT */
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${element(var.public_subnet_ids, 0)}"
  tags = {
    Name        = "nat"
    Environment = "${var.environment}"
  }
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = module.private_subnet.private_rt
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}

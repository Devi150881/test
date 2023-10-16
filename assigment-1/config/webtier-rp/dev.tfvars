
###################common tags
project_code  = "test"
environment   = "dev"
tier          = "web"
zone          = "ez"
create_method = "iac-terraform"
agency_code   = "test"

########### alb #########
alb_name  = "test-alb"
public_subnet_ids = ["subnet-08c496000a80266d6","subnet-017fcc9b32fdf3319"]

vpc_id = "vpc-0457dd65af10c0ff1"

security_group_rules_alb = {
    name = "AllowAccess",
    ingress = [
        {
            description = "AllowAccess"
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ],
     egress = [
        {
            description = "AllowAccess"
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]

} 

############### Web Server #############
web_server_name = "test_web"

security_group_rules_web = {
    name = "AllowAccess",
    ingress = [
        {
            description = "AllowAccess"
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            description = "AllowAccess"
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            description = "AllowAccess"
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ],
     egress = [
        {
            description = "AllowAccess"
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            description = "AllowAccess"
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]

} 

folder_name = "webtier-rp"
file_name_iamrole = "iam-policy-dev"
file_name_iampolicy = "iam-dev"
file_name_sm = "secret-policy"

private_subnets_cidr = ["172.31.48.0/20","172.31.64.0/20"]
availability_zones = ["ap-southeast-1a","ap-southeast-1b"]
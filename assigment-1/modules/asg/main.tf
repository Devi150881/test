# Launch Template and ASG Resources
data "template_file" "init" {
  template = file("../../config/${var.folder_name}/user_data.tpl")
  vars = {
    s3_path = var.s3_path
  }
}

resource "aws_launch_template" "launch_template" {
  name          = "lt-${var.project_code}-${var.environment}${var.zone}${var.tier}-rp"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name = var.aws_key_pair

  network_interfaces {
    device_index    = 0
    security_groups = var.vm_security_group_ids
  }
  iam_instance_profile {
    name = "test_profile"
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
    Name = "lt-${var.project_code}-${var.environment}${var.zone}${var.tier}-rp"
    }
  }

 user_data = base64encode(data.template_file.init.rendered)
}

resource "aws_autoscaling_group" "auto_scaling_group" {
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.vpc_zone_identifier
  target_group_arns   = var.aws_alb_target_group_arn

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = var.ec2_role
}
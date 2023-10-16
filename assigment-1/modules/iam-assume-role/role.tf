resource "aws_iam_role" "role" {
  count       = var.create_role ? 1 : 0
  name                  = "iam-role-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.service_name}"
  description           = var.description
  force_detach_policies = var.force_detach_policies
  managed_policy_arns   = var.managed_policy_arns
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary
  assume_role_policy    = file("../../config/${var.folder_name}/${var.file_name}.json")

}

resource "aws_iam_role_policy_attachment" "managedpolicy_SSM" {
  role       = aws_iam_role.role[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "managedpolicy_cloudwatch" {
  role       = aws_iam_role.role[0].name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
}

resource "aws_iam_role_policy_attachment" "managedpolicy_s3" {
  role       = aws_iam_role.role[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_policy" "iam_policy" {
  name        = "iam-policy-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.service_name}"
  description = var.description
  policy      = templatefile("${("../../config/${var.folder_name}/${var.file_name}.json")}", {})
  tags = {
    "zone" = var.zone
    "tier" = var.tier
  }
}

resource "aws_iam_policy_attachment" "iam_policy_attachment" {
  count      = var.create_policy_attachment ? 1 : 0
  name       = "iam-policy-attachment-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.service_name}"
  users      = var.users
  roles      = var.roles
  groups     = var.groups
  policy_arn = aws_iam_policy.iam_policy.arn
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  count      = var.create_role_policy_attachment ? 1 : 0
  role       = var.role_name
  policy_arn = aws_iam_policy.iam_policy.arn
}

resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
  count      = var.create_user_policy_attachment ? 1 : 0
  user       = var.user_name
  policy_arn = aws_iam_policy.iam_policy.arn
}

resource "aws_iam_group_policy_attachment" "iam_group_policy_attachment" {
  count      = var.create_group_policy_attachment ? 1 : 0
  group      = var.group_name
  policy_arn = aws_iam_policy.iam_policy.arn
}
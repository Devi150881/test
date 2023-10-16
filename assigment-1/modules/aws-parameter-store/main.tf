resource "aws_ssm_parameter" "aws_parameter_write" {
 for_each = toset(keys({for i, r in var.aws_parameter_write: i => r}))
  name = "param-${var.project_code}-${var.environment}${var.zone}${var.tier}-${var.aws_parameter_write[each.value]["name"]}"
  value = var.aws_parameter_write[each.value]["value"]
  type = var.aws_parameter_write[each.value]["type"]
  overwrite = var.aws_parameter_write[each.value]["overwrite"]
  tier = var.aws_parameter_write[each.value]["param_tier"]
  key_id = var.kms_id
  tags =  {
   Zone         = var.zone
   Tier          = var.tier
  }
}

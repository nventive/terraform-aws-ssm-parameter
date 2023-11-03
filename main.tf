locals {
  enabled         = module.this.enabled
  description     = length(var.description) > 0 ? var.description : module.this.id
  ssm_get_arn     = join("", aws_ssm_parameter.default.*.arn)
  parameter_value = length(var.value_base64) > 0 ? base64decode(var.value_base64) : var.value
}

module "ssm_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context   = module.this.context
  delimiter = "/"
}

resource "aws_ssm_parameter" "default" {
  count = local.enabled ? 1 : 0

  name        = "/${module.ssm_label.id}"
  description = local.description
  type        = var.type
  value       = local.parameter_value
  overwrite   = true

  tags = module.this.tags
}

data "aws_iam_policy_document" "ssm" {
  statement {
    sid       = "AllowReadSsmParameter"
    actions   = ["ssm:GetParameters"]
    resources = [local.ssm_get_arn == "" ? "*" : local.ssm_get_arn]
  }

  statement {
    sid       = "AllowDescribeSsmParameters"
    actions   = ["ssm:DescribeParameters"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ssm_get" {
  count = local.enabled && var.policy_enabled ? 1 : 0

  name   = "${module.this.id}-ssm-get"
  path   = "/"
  policy = data.aws_iam_policy_document.ssm.json

  tags = module.this.tags
}

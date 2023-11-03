output "arn" {
  value       = join("", aws_ssm_parameter.default.*.arn)
  description = "ARN of the SSM parameter."
}

output "id" {
  value       = join("", aws_ssm_parameter.default.*.id)
  description = "ID of the SSM parameter."
}

output "name" {
  value       = join("", aws_ssm_parameter.default.*.name)
  description = "Name of the SSM parameter."
}

output "iam_policy_get_arn" {
  value       = join("", aws_iam_policy.ssm_get.*.arn)
  description = "ARN of the IAM Policy with GET permission SSM parameter."
}

output "enabled" {
  value       = local.enabled
  description = "Whether or not the module is enabled."
}

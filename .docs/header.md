![nventive](https://nventive-public-assets.s3.amazonaws.com/nventive_logo_github.svg?v=2)

# terraform-aws-ssm-parameter

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=flat-square)](LICENSE) [![Latest Release](https://img.shields.io/github/release/nventive/terraform-aws-ssm-parameter.svg?style=flat-square)](https://github.com/nventive/terraform-aws-ssm-parameter/releases/latest)

Terraform module to create an SSM Parameter with an IAM policy to access it.

---

## Examples

**IMPORTANT:** We do not pin modules to versions in our examples because of the difficulty of keeping the versions in
the documentation in sync with the latest released versions. We highly recommend that in your code you pin the version
to the exact version you are using so that your infrastructure remains stable, and update versions in a systematic way
so that they do not catch you by surprise.

```hcl
module "ssm_parameter" {
  source = "nventive/ssm-parameter/aws"
  # We recommend pinning every module to a specific version
  # versoin = "x.x.x"

  namespace = "eg"
  stage     = "test"
  name      = "app"

  name         = "very-secret-secret"
  description  = "A very secret secret."
  value_base64 = "VXBVcERvd25Eb3duTGVmdFJpZ2h0TGVmdFJpZ2h0QkE="
}
```

variable "root_id" {}
variable "nonprod_ou_id" {}
variable "prod_ou_id" {}

# Deny Root User Usage
resource "aws_organizations_policy" "deny_root" {
  name = "DenyRootUser"
  type = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Deny"
      Action   = "*"
      Resource = "*"
      Condition = {
        StringLike = {
          "aws:PrincipalArn" = "*:root"
        }
      }
    }]
  })
}

# Restrict Prod Changes
resource "aws_organizations_policy" "prod_restrictions" {
  name = "ProdRestrictions"
  type = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Deny"
      Action = [
        "ec2:TerminateInstances",
        "iam:DeleteRole"
      ]
      Resource = "*"
    }]
  })
}

resource "aws_organizations_policy_attachment" "root_attach" {
  policy_id = aws_organizations_policy.deny_root.id
  target_id = var.root_id
}

resource "aws_organizations_policy_attachment" "prod_attach" {
  policy_id = aws_organizations_policy.prod_restrictions.id
  target_id = var.prod_ou_id
}

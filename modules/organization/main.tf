resource "aws_organizations_organization" "this" {
  feature_set = "ALL"

  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "guardduty.amazonaws.com",
    "securityhub.amazonaws.com"
  ]
}

data "aws_organizations_organization" "current" {}

output "organization_id" {
  value = aws_organizations_organization.this.id
}

output "root_id" {
  value = data.aws_organizations_organization.current.roots[0].id
}

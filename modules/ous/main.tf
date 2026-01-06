variable "root_id" {}

resource "aws_organizations_organizational_unit" "nonprod" {
  name      = "NonProd"
  parent_id = var.root_id
}

resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod"
  parent_id = var.root_id
}

output "nonprod_ou_id" {
  value = aws_organizations_organizational_unit.nonprod.id
}

output "prod_ou_id" {
  value = aws_organizations_organizational_unit.prod.id
}

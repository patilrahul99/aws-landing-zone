variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "accounts" {
  description = "AWS accounts to create"
  type = map(object({
    name  = string
    email = string
  }))
}

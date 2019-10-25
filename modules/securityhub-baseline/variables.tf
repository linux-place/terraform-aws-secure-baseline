variable "enabled" {
  description = "The boolean flag whether this module is enabled or not. No resources are created when set to false."
  default     = true
}
variable "sechub_subs_enabled" {
  description = "The boolean flag whether this module is enabled or not. No resources are created when set to false."
  default     = true
}
variable "member_accounts" {
  description = "A list of IDs and emails of AWS accounts which associated as member accounts."
  type = list(object({
    account_id = string
    email      = string
  }))
  default = []
}
data "aws_region" "current" {}

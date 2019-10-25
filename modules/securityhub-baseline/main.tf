# --------------------------------------------------------------------------------------------------
# Enable SecurityHub
# --------------------------------------------------------------------------------------------------
resource "aws_securityhub_account" "main" {
  count = var.enabled ? 1 : 0
}

resource "null_resource" "aws_securityhub_members" {
  count = length(var.member_accounts)

  provisioner "local-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    #command = ${format("aws securityhub create-member --account-details AccountId=%s,Email=%s",${var.member_accounts[count.index].account_id},${var.member_accounts[count.index].email})}
    command = "aws securityhub create-members --account-details AccountId=${var.member_accounts[count.index].account_id},Email=${var.member_accounts[count.index].email} --region ${data.aws_region.current.name}"
  }
}
resource "null_resource" "aws_securityhub_invitations" {
  count = length(var.member_accounts)
  provisioner "local-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    #command = ${format("aws securityhub create-member --account-details AccountId=%s,Email=%s",${var.member_accounts[count.index].account_id},${var.member_accounts[count.index].email})}
    command = "aws securityhub invite-members --account-ids ${var.member_accounts[count.index].account_id} --region ${data.aws_region.current.name}"
  }
}
# --------------------------------------------------------------------------------------------------
# Subscribe CIS benchmark
# --------------------------------------------------------------------------------------------------
resource "aws_securityhub_standards_subscription" "cis" {
  count = var.enabled && var.sechub_subs_enabled ? 1 : 0
  depends_on    = [aws_securityhub_account.main]
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
}



# --------------------------------------------------------------------------------------------------
# Enable SecurityHub
# --------------------------------------------------------------------------------------------------
resource "aws_securityhub_account" "main" {
  count = var.enabled ? 1 : 0
}
# --------------------------------------------------------------------------------------------------
# Creating Members and inviting accounts
# --------------------------------------------------------------------------------------------------
resource "null_resource" "aws_securityhub_members" {
  count = var.enabled ? length(var.member_accounts) : 0

  provisioner "local-exec" {
    #command = ${format("aws securityhub create-member --account-details AccountId=%s,Email=%s",${var.member_accounts[count.index].account_id},${var.member_accounts[count.index].email})}
    command = "aws securityhub create-members --account-details AccountId=${var.member_accounts[count.index].account_id},Email=${var.member_accounts[count.index].email} --region ${data.aws_region.current.name}"
  }
}
resource "null_resource" "aws_securityhub_invitations" {
  count = var.enabled ? length(var.member_accounts) : 0
  provisioner "local-exec" {
    #command = ${format("aws securityhub create-member --account-details AccountId=%s,Email=%s",${var.member_accounts[count.index].account_id},${var.member_accounts[count.index].email})}
    command = "aws securityhub invite-members --account-ids ${var.member_accounts[count.index].account_id} --region ${data.aws_region.current.name}"
  }
}
# --------------------------------------------------------------------------------------------------
# Subscribe CIS benchmark
# --------------------------------------------------------------------------------------------------
resource "aws_securityhub_standards_subscription" "cis" {
  #count = var.enabled && var.sechub_subs_enabled ? 1 : 0
  count = var.enabled ? 1 : 0
  depends_on    = [aws_securityhub_account.main]
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
}
# --------------------------------------------------------------------------------------------------
# Listing and accepting invitations
# --------------------------------------------------------------------------------------------------
data "external" "invitation" {
  count = var.enabled && var.is_member_account? 1 : 0
  program = [ "bash", "-c", "aws securityhub list-invitations --region ${data.aws_region.current.name} | jq -r '.Invitations[0]'"]
}

resource "null_resource" "accept_invitation" {
  ###count = length(data.external.invitation)
  count = var.enabled && var.is_member_account ? 1 : 0
    provisioner "local-exec" {
    command = "aws securityhub accept-invitation --master-id ${var.master_account_id} --invitation-id ${data.external.invitation[0].result["InvitationId"]} --region ${data.aws_region.current.name}"
  }
}

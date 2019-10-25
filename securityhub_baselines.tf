# --------------------------------------------------------------------------------------------------
# AWS SecurityHub Baseline
# Needs to be set up in each region.
# --------------------------------------------------------------------------------------------------
module "securityhub_baseline_ap-northeast-1" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.ap-northeast-1
  }

  enabled                       = contains(var.target_regions, "ap-northeast-1")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_ap-northeast-2" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.ap-northeast-2
  }

  enabled                       = contains(var.target_regions, "ap-northeast-2")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_ap-south-1" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.ap-south-1
  }

  enabled                       = contains(var.target_regions, "ap-south-1")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_ap-southeast-1" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.ap-southeast-1
  }

  enabled                       = contains(var.target_regions, "ap-southeast-1")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_ap-southeast-2" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.ap-southeast-2
  }

  enabled                       = contains(var.target_regions, "ap-southeast-2")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_ca-central-1" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.ca-central-1
  }

  enabled                       = contains(var.target_regions, "ca-central-1")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_eu-central-1" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.eu-central-1
  }

  enabled                       = contains(var.target_regions, "eu-central-1")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_eu-north-1" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.eu-north-1
  }

  enabled                       = contains(var.target_regions, "eu-north-1")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_eu-west-1" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.eu-west-1
  }

  enabled                       = contains(var.target_regions, "eu-west-1")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_eu-west-2" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.eu-west-2
  }

  enabled                       = contains(var.target_regions, "eu-west-2")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_eu-west-3" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.eu-west-3
  }

  enabled                       = contains(var.target_regions, "eu-west-3")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_sa-east-1" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.sa-east-1
  }

  enabled                       = contains(var.target_regions, "sa-east-1")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
  member_accounts               = var.member_accounts
}

module "securityhub_baseline_us-east-1" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.us-east-1
  }

  enabled                       = contains(var.target_regions, "us-east-1")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
  member_accounts               = var.member_accounts
}

module "securityhub_baseline_us-east-2" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.us-east-2
  }

  enabled                       = contains(var.target_regions, "us-east-2")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_us-west-1" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.us-west-1
  }

  enabled                       = contains(var.target_regions, "us-west-1")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

module "securityhub_baseline_us-west-2" {
  source = "./modules/securityhub-baseline"

  providers = {
    aws = aws.us-west-2
  }

  enabled                       = contains(var.target_regions, "us-west-2")
  sechub_subs_enabled           = local.is_individual_account || local.is_master_account
}

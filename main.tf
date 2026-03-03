terraform {
  required_version = ">= 1.7" # for_each import blocks

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

  # Switch to a remote backend (e.g. GCS) once you have one:
  # backend "gcs" {
  #   bucket = "divitmittal-tfstate"
  #   prefix = "github"
  # }
}

provider "github" {
  owner = var.github_owner
  # Reads GITHUB_TOKEN from env automatically
}

# ---------------------------------------------------------------------------
# State migration: relocate all for_each instances from the old flat root
# addresses to their new module addresses. Terraform resolves every instance
# key automatically — one moved block per resource type is sufficient.
# These blocks can be removed after the first successful apply.
# ---------------------------------------------------------------------------
moved {
  from = github_repository.repos
  to   = module.repositories.github_repository.repos
}

moved {
  from = github_branch_protection.active_repos
  to   = module.branch_protection.github_branch_protection.active_repos
}

# ---------------------------------------------------------------------------
# Import all existing repos into state without destroying and re-creating them.
# Requires Terraform >= 1.7 (for_each import blocks).
# Run once: terraform plan  — Terraform will show a read-only import plan.
# Then:     terraform apply — state is populated, no resources are recreated.
# ---------------------------------------------------------------------------
import {
  for_each = local.repos
  to       = module.repositories.github_repository.repos[each.key]
  id       = each.key
}

# ---------------------------------------------------------------------------
# Modules
# ---------------------------------------------------------------------------
module "repositories" {
  source = "./modules/repositories"
  repos  = local.repos
}

module "branch_protection" {
  source        = "./modules/branch-protection"
  repo_node_ids = module.repositories.node_ids
}

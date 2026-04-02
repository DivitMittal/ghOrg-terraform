locals {
  # Repos where we enforce branch protection rules.
  # Supplied per org via var.protected_branches (defined in each org's locals.tf).
  protected_branches = var.protected_branches
}

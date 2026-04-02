locals {
  # Canonical definition of every Qezta-owned repository.
  # Add entries here; run `terragrunt plan` to preview, `terragrunt apply` to apply.
  # For repos that already exist on GitHub, omit `existing` (defaults to true) and
  # they will be imported. For net-new repos, set `existing = false`.
  repos = {
    # "my-repo" = {
    #   description            = "..."
    #   visibility             = "public"  # or "private"
    #   topics                 = ["nix"]
    #   delete_branch_on_merge = true
    # }
  }

  # Branch protection rules for Qezta repos.
  # Add entries matching keys in `repos` above.
  protected_branches = {
    # "my-repo" = { branch = "main" }
  }
}

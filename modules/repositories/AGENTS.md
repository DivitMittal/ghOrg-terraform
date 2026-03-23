# MODULE: repositories

## OVERVIEW
Defines `github_repository` resources for every repo passed in from the root module.

## WHERE TO LOOK
| Task | Location | Notes |
|------|----------|-------|
| Repo map input | `modules/repositories/variables.tf` | `repos` is passed from root. |
| Resource behavior | `modules/repositories/main.tf` | Defaults, lifecycle, validation. |
| Repo list indirection | `modules/repositories/locals.tf` | Mirrors `var.repos`. |
| Outputs | `modules/repositories/outputs.tf` | node_ids, urls, counts. |

## CONVENTIONS
- `repos` data comes from root `locals.tf` so root `import` blocks can reuse it.
- Wikis/projects are disabled across all repos (`has_wiki`, `has_projects`).
- Public repos enable `vulnerability_alerts` automatically.
- `auto_init` is ignored to avoid drift from GitHub auto-initialization.
- Active repos must have non-empty descriptions (plan-time `check` block).
- `node_ids` output feeds the branch-protection module.
- `repo_urls`, `private_repos`, `archived_repos`, `repo_count` are derived outputs.
- `delete_branch_on_merge` is set per repo; keep defaults in the map.
- Topics are sourced from the repo map and passed through verbatim.

## ANTI-PATTERNS
- Do not inline a new repo list here; root `locals.tf` is the source of truth.
- Do not remove `prevent_destroy` from `github_repository` lifecycle.
- Do not bypass the description check for active repos.
- Do not change `ignore_changes = [auto_init]`; it prevents churn from GitHub defaults.

## NOTES
- Root `main.tf` owns the `import` blocks; this module stays import-free.
- `has_issues` defaults to true unless explicitly overridden per repo.

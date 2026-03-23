# MODULE: branch-protection

## OVERVIEW
Applies uniform branch protection rules using repo node IDs from the repositories module.

## WHERE TO LOOK
| Task | Location | Notes |
|------|----------|-------|
| Protected branches list | `modules/branch-protection/locals.tf` | Repo -> branch only. |
| Rule definitions | `modules/branch-protection/main.tf` | Single rule set for all repos. |
| Input wiring | `modules/branch-protection/variables.tf` | `repo_node_ids` map. |
| Outputs | `modules/branch-protection/outputs.tf` | Applied rules per repo. |

## CONVENTIONS
- `locals.tf` stores only branch names; settings live in `main.tf`.
- `repository_id` is sourced from `var.repo_node_ids` to avoid cross-module refs.
- Existing protections can be imported using the command in `main.tf` header.
- Admins are not enforced; linear history + conversation resolution are required.
- Force-pushes and deletions are disabled (`allows_force_pushes = false`, `allows_deletions = false`).
- Import format is `repo:branch` (see header example in `main.tf`).

## ANTI-PATTERNS
- Do not reference `github_repository` directly in this module.
- Do not move branch rules into `locals.tf`; keep uniform settings in code.
- Do not add per-repo rule settings here; only the branch name varies.

## NOTES
- Import example in `main.tf` is the authoritative syntax for `terraform import`.
- `repo_node_ids` comes from `modules/repositories/outputs.tf`.
- `required_linear_history = true` is enforced for all protected branches.

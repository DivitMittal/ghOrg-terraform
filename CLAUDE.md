# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Terraform project that declaratively manages the `DivitMittal` GitHub organization's repositories and branch protections via the GitHub provider. `locals.tf` is the single source of truth for all repo definitions.

## Development Environment

Enter the Nix devshell (provides `terraform`, `gh`, `nixd`, `alejandra`):
```bash
nix develop
# or automatically via direnv: direnv allow
```

## Common Commands

```bash
# Plan changes
terraform plan

# Apply changes
terraform apply

# Format all files
nix fmt

# Run pre-commit checks (formatters, secret detection, etc.)
nix flake check
```

## Architecture

```
github-terraform/
├── main.tf           # provider config + module calls + moved blocks (state migration)
├── variables.tf      # github_owner var
├── outputs.tf        # delegates to module outputs
├── modules/
│   ├── repositories/
│   │   ├── locals.tf     # canonical repos map — edit here to add/modify repos
│   │   ├── main.tf       # github_repository resource + import blocks + check block
│   │   └── outputs.tf    # node_ids (for branch-protection), repo_urls, counts
│   └── branch-protection/
│       ├── locals.tf     # protected_branches map
│       ├── variables.tf  # repo_node_ids input (from repositories module)
│       ├── main.tf       # github_branch_protection resource
│       └── outputs.tf    # protected_branch_rules
└── flake/            # Nix: devshell, formatters, pre-commit hooks, CI generation
```

### Key Patterns

- **Module wiring**: `repositories` outputs `node_ids`; `branch_protection` receives them via `var.repo_node_ids` — avoids cross-module resource references.
- **Import blocks** (Terraform 1.7+): repos are adopted in-place — never recreated from scratch.
- **`prevent_destroy = true`**: all repo resources are guarded against accidental deletion.
- **`check` block**: validates that all active repos have descriptions before any apply.
- **`moved` blocks in `main.tf`**: migrate state from old flat addresses to module addresses — safe to remove after first apply.

### Adding a New Repository

1. Add an entry to the `repos` map in `modules/repositories/locals.tf`.
2. Add a corresponding `import` block in `modules/repositories/main.tf` pointing to the existing GitHub repo slug.
3. If branch protection is needed, add to `protected_branches` in `modules/branch-protection/locals.tf`.
4. Run `terraform plan` to verify, then `terraform apply`.

## CI/CD

GitHub Actions workflows are **generated from Nix** (`flake/actions/`):
- `flake-check`: runs `nix flake check` on push/PR affecting `flake.nix` or `flake.lock`
- `flake-lock-update`: weekly auto-update of Nix inputs via `DeterminateSystems/update-flake-lock`

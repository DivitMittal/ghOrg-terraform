# MODULE: flake

## OVERVIEW
Nix flake that defines devshell tooling, formatters, pre-commit hooks, and CI workflow generation.

## WHERE TO LOOK
| Task | Location | Notes |
|------|----------|-------|
| Flake entry | `flake.nix` | Inputs + flake-parts wiring. |
| Devshell tools | `flake/devshells.nix` | Includes `terraform`, `gh`, `nixd`, `alejandra`. |
| Formatters | `flake/formatters.nix` | treefmt + terraform formatter. |
| Pre-commit hooks | `flake/checks.nix` | Generates `.pre-commit-config.yaml`. |
| CI workflow sources | `flake/actions/*.nix` | Generates `.github/workflows/*.yml`. |

## CONVENTIONS
- Workflows are generated via actions.nix into `.github/workflows/`.
- Render workflows with `nix run .#render-workflows` (pre-commit runs it too).
- treefmt excludes `.github/*` from formatting.
- Pre-commit uses `prek` and local hooks defined in `flake/checks.nix`.
- Formatters include `alejandra`, `deadnix`, `statix`, and `terraform` (see `flake/formatters.nix`).
- Pre-commit excludes `flake.lock` from checks (see `flake/checks.nix`).

## ANTI-PATTERNS
- Do not edit `.github/workflows/*.yml` directly.
- Do not edit `.pre-commit-config.yaml` by hand.

## NOTES
- `flake/actions/flake-check.nix` and `flake/actions/flake-lock-update.nix` define the current workflows.
- `flake/devshells.nix` installs `gh` for manual GitHub API verification.
- `flake/formatters.nix` disables treefmt's `flakeCheck` for this repo.

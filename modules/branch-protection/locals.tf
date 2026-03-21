locals {
  # Repos where we enforce branch protection rules.
  # Values supply only the branch name; settings are uniform (see main.tf).
  protected_branches = {
    "ghOrg-terraform"           = { branch = "main" }
    "OS-nixCfg"                 = { branch = "master" }
    "ai-nixCfg"                 = { branch = "master" }
    "firefox-nixCfg"            = { branch = "main" }
    "Vim-Cfg"                   = { branch = "main" }
    "Emacs-Cfg"                 = { branch = "main" }
    "hammerspoon-nix"           = { branch = "main" }
    "TermEmulator-Cfg"          = { branch = "master" }
    "tidalcycles-nix"           = { branch = "master" }
    "PKMS"                      = { branch = "main" }
    "TLTR"                      = { branch = "master" }
    "professionalstay-site"     = { branch = "master" }
    "MeriNetWorth"              = { branch = "main" }
    "Lagrangian-Reconstruction" = { branch = "main" }
    "hs-faust"                  = { branch = "main" }
  }
}

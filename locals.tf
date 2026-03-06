locals {
  # Canonical definition of every owned repository.
  # Keys are exact GitHub repo names; values drive github_repository resources.
  # Forks (nixpkgs, home-manager, faust, …) are intentionally excluded.
  # Third-party access repos (UnrealEngine, …) are intentionally excluded.
  repos = {

    ## ── Nix / Infrastructure ─────────────────────────────────────────────────

    "OS-nixCfg" = {
      description            = "nix (via nix-darwin, nixos, nix-on-droid, home-manager, etc.) declarative configurations to attain my deterministically reproducible layer"
      visibility             = "public"
      topics                 = ["agenix", "emacs", "flake-parts", "flakes", "home-manager", "neovim", "nix", "nix-darwin", "nix-on-droid", "nixos", "nixos-wsl"]
      delete_branch_on_merge = true
    }
    "OS-nixCfg-secrets" = {
      description            = "Secrets management repo for OS-nixCfg nix configuration"
      visibility             = "private"
      topics                 = ["agenix", "flake-parts", "nix", "secrets"]
      delete_branch_on_merge = true
    }
    "ai-nixCfg" = {
      description            = "Nix home-manager modules and configurations for AI coding assistants."
      visibility             = "public"
      topics                 = ["ai", "ai-workflows", "claude-code", "flake", "flake-parts", "home-manager", "llms", "nix", "opencode"]
      delete_branch_on_merge = true
    }
    "firefox-nixCfg" = {
      description            = "A declarative Firefox configuration using Nix home-manager, designed for enhanced performance, a streamlined UI, and powerful automation"
      visibility             = "public"
      topics                 = ["autoconfig", "betterfox", "css", "firefox", "flake-parts", "flakes", "javascript", "nix", "sideberry", "tridactyl"]
      delete_branch_on_merge = true
    }
    "TermEmulator-Cfg" = {
      description            = "Terminal emulator configurations for OS-nixCfg"
      visibility             = "public"
      topics                 = ["flake", "flake-parts", "kitty", "nix", "terminal", "wezterm"]
      delete_branch_on_merge = true
    }
    "Vim-Cfg" = {
      description            = "Neovim & vim configurations for OS-nixCfg deployed via nix home-manager"
      visibility             = "public"
      topics                 = ["lazy-loading", "lua", "neovim", "nix", "nvchad", "nvim", "vim", "vimrc", "vimscript"]
      delete_branch_on_merge = true
    }
    "Emacs-Cfg" = {
      description            = "An elisp GNU Emacs configuration for Doom for OS-nixCfg via nix home-manager module, i.e., nix-doom-emacs-unstraightened"
      visibility             = "public"
      topics                 = ["elisp", "emacs", "emacs-lisp", "flake", "flake-parts", "functional-programming", "nix"]
      delete_branch_on_merge = true
    }
    "hammerspoon-nix" = {
      description            = "A nix home-manager module for hammerspoon & my personal lua hammerspoon configuration"
      visibility             = "public"
      topics                 = ["flake", "flake-parts", "hammerspoon", "lua", "nix"]
      delete_branch_on_merge = true
    }
    "tidalcycles-nix" = {
      description            = "Comprehensive standalone Nix flake providing a home-manager module for TidalCycles live coding environment"
      visibility             = "public"
      topics                 = ["flake", "flake-parts", "haskell", "home-manager", "livecoding", "music", "nix", "supercollider", "tidalcycles"]
      delete_branch_on_merge = true
    }

    ## ── AI / Machine Learning ────────────────────────────────────────────────

    "DocAssist-LLM" = {
      description            = "RAG-enhanced LLaMa-like transformer neural network based LLM for assistance on programming languages/frameworks' documentations."
      visibility             = "public"
      topics                 = ["artifical-intelligense", "deep-learning", "flake-parts", "llama", "llm", "nix", "pytorch", "rag", "transformers"]
      delete_branch_on_merge = false
    }
    "CARLA-Autonomous-Driving" = {
      description            = "Via high-fidelity CARLA vehicle simulator & deep semantic segmentation, data from RGBA cameras and LiDAR sensors are combined to achieve comprehensive environmental awareness"
      visibility             = "public"
      topics                 = ["autonoumous-driving", "carla-simulator", "deep-learning", "pygame", "semantic-segmentation"]
      delete_branch_on_merge = false
    }
    "Driver-Drowsiness-Detection" = {
      description            = "Real-time drowsiness detection on driver's face continuously for signs of fatigue using deep learning methodologies"
      visibility             = "public"
      topics                 = ["computer-vision", "deep-learning", "drowsiness-detection", "siamese-neural-network"]
      delete_branch_on_merge = false
    }
    "HybridTransformer-MFIF" = {
      description            = "Implementing Focal Transformer & CrossViT Hybrid for MFIF"
      visibility             = "private"
      topics                 = ["computer-vision", "crossvit", "deep-learning", "focal-transformer", "image-fusion", "transformers"]
      delete_branch_on_merge = false
    }
    "CUDA-Transformer" = {
      description            = "CUDA-accelerated transformer implementation"
      visibility             = "private"
      topics                 = ["cuda", "deep-learning", "diabetic-retinopathy-detection", "transformer"]
      delete_branch_on_merge = false
    }
    "LLM-feeder" = {
      description            = "Multiple-choice questions (MCQs) are parsed, & the question is sent to a Large Language Model (LLM) to obtain an answer"
      visibility             = "private"
      topics                 = ["llm"]
      delete_branch_on_merge = false
    }
    "ZestaAds" = {
      description            = "Generative AI ad network with personalized, UI-integrated ads via API."
      visibility             = "public"
      topics                 = ["advertising", "ai", "concept", "genai", "ideation", "marketing", "prototype"]
      delete_branch_on_merge = false
    }
    "Zesta-Car-App" = {
      description            = "Swift license plate recognition deep learning model with a cross-platform (mobile, web) front-end to obtain info. pertaining to the vehicle in real-time."
      visibility             = "public"
      topics                 = ["computer-vision", "deep-learning", "expo", "nodejs", "ocr-recognition", "react-native"]
      delete_branch_on_merge = false
    }
    "Blinkit-Churn-Analysis" = {
      description            = "Analyzing customer attrition & strategies to reduce churn via AutoML techniques & PowerBI"
      visibility             = "public"
      topics                 = ["churn-analysis", "dashboards", "h2oai", "powerbi", "sweetviz"]
      delete_branch_on_merge = false
    }
    "Datathon-BigData" = {
      description            = "Efficient Data Processing ETL Pipeline for Event Records"
      visibility             = "public"
      topics                 = ["aws", "aws-glue", "aws-lambda", "aws-s3", "etl-pipeline", "hadoop", "spark"]
      delete_branch_on_merge = false
    }

    ## ── Personal Tools / Projects ────────────────────────────────────────────

    "TLTR" = {
      description            = "Cross-platform multi-layer keyboard layout tailored for programmers"
      visibility             = "public"
      topics                 = ["developer-productivity", "ergonomic-keyboard", "kanata", "karabiner-elements", "keyboard", "keyboard-layout", "keymap-drawer", "qmk", "raspberry-pi-pico", "split-keyboard", "tltr"]
      delete_branch_on_merge = true
    }
    "PKMS" = {
      description            = "A Personal Knowledge Management System in Obsidian-style markdown following the Zettelkasten method"
      visibility             = "public"
      topics                 = ["flake-parts", "kms", "markdown", "nix", "obsidian", "pkms", "second-brain", "wiki", "zettelkasten"]
      delete_branch_on_merge = true
    }
    "MeriNetWorth" = {
      description            = "Bank account consolidation system with multi-format statement extraction and visual analytics dashboard"
      visibility             = "public"
      topics                 = ["dashboard", "flake", "flake-parts", "nix", "python", "streamlit", "uv"]
      delete_branch_on_merge = true
    }
    "Lagrangian-Reconstruction" = {
      description            = "Go implementation of Shamir's Secret Sharing via Lagrange interpolation for polynomial reconstruction."
      visibility             = "public"
      topics                 = ["direnv", "flakes", "golang", "lagrange-polynomial-interpolation", "nix", "shamir-secret-sharing"]
      delete_branch_on_merge = true
    }
    "hs-faust" = {
      description            = "Haskell DSL wrapper for writing DSP files utilizing the Faust's Signal API & Compiler"
      visibility             = "public"
      topics                 = ["compilers", "dsl", "flake-parts", "functional-programming", "nix"]
      delete_branch_on_merge = true
    }
    "professionalstay-site" = {
      description            = "Professional Stay Homepage"
      visibility             = "public"
      topics                 = ["nextjs", "nix", "reactjs", "shadcn-ui", "tailwindcss"]
      delete_branch_on_merge = true
    }
    "mcp-kaggle-tool" = {
      description            = "MCP server for Kaggle API integration - create, run, and manage Kaggle notebooks programmatically"
      visibility             = "public"
      has_issues             = false
      topics                 = []
      delete_branch_on_merge = true
    }
    "AudioResSwitcher-Raycast" = {
      description            = "Control audio quality with precision. Switch sample rates, bit depth, and formats for input/output devices. Monitor current bitrate in menubar."
      visibility             = "public"
      topics                 = []
      delete_branch_on_merge = true
    }

    ## ── Dotfiles / Sync ──────────────────────────────────────────────────────

    "sync-windows" = {
      description            = "~/.* (Windows)"
      visibility             = "public"
      topics                 = ["dotfiles", "dotfiles-windows", "flake-parts", "nix", "powershell", "windows-10", "windows-11"]
      delete_branch_on_merge = false
    }

    ## ── Profile / Meta ───────────────────────────────────────────────────────

    "DivitMittal" = {
      description            = "Repository to setup GitHub profile."
      visibility             = "public"
      topics                 = ["html", "information", "markdown", "profile", "profile-readme", "stats"]
      delete_branch_on_merge = false
    }
    "awesome" = {
      description            = "Personal Awesome list"
      visibility             = "public"
      topics                 = ["awesome-lists", "floss", "foss", "github", "sourcehut"]
      delete_branch_on_merge = false
    }
    "employee-management" = {
      description            = "Flutter employee management cross-platform app"
      visibility             = "public"
      topics                 = ["android", "cross-platform", "dart", "employee-management", "flutter", "ios"]
      delete_branch_on_merge = false
    }

    ## ── Archived ─────────────────────────────────────────────────────────────

    "kanata-service" = {
      description            = "A macOS launchctl wrapper to run Kanata (keyboard remapper) on startup/load as a daemon."
      visibility             = "public"
      archived               = true
      topics                 = ["bash", "kanata", "launchctl", "plist"]
      delete_branch_on_merge = false
    }
    "sync-android" = {
      description            = "~/.* (Android)"
      visibility             = "public"
      archived               = true
      topics                 = ["android", "dotfiles", "dotfiles-android", "flake-parts", "nix"]
      delete_branch_on_merge = false
    }
    "sync-macOS" = {
      description            = "Contains all dotfiles, config files, package-manager bundles, shell scripts, preferences files, etc., to setup macOS."
      visibility             = "public"
      archived               = true
      has_issues             = false
      topics                 = ["config", "doom", "dotfiles", "dotfiles-macos", "emacs", "mackup", "nvim", "raycast", "skhd", "vim", "yabai"]
      delete_branch_on_merge = false
    }
    "git-fun" = {
      description            = "My first app on GitHub!"
      visibility             = "public"
      archived               = true
      topics                 = []
      delete_branch_on_merge = false
    }
  }
}

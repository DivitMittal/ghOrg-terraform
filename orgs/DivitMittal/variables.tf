variable "github_token" {
  description = "GitHub PAT for the DivitMittal org. Injected by Terragrunt from GITHUB_TOKEN_DIVITMITTAL or GITHUB_TOKEN."
  type        = string
  sensitive   = true
}

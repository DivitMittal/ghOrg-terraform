variable "repos" {
  description = "Canonical map of repository names to their configuration. Defined in root locals.tf and passed here so that import blocks (root-only) can reference the same map."
  type        = any
}

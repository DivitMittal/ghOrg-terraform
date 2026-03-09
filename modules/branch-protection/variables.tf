variable "repo_node_ids" {
  description = "Map of repository name to GitHub node_id. Provided by the repositories module output."
  type        = map(string)
}

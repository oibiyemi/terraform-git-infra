# -----------------------------------------------
# GitHub Repository Configurations
# -----------------------------------------------
# Each key below represents one GitHub repository
# managed in this portfolio.
#
# Use this variable to control basic settings like:
#  - visibility (public/private)
#  - wiki availability
#  - merge strategy preferences
#
# Helps keep all repos consistent and easy to manage.
# -----------------------------------------------

variable "repo_config" {
  description = "Configuration map for GitHub repositories"
  type = map(object({
    description        = string,
    visibility         = string,
    auto_init          = bool,
    has_wiki           = bool
    allow_merge_commit = bool
    allow_squash_merge = bool
    allow_rebase_merge = bool
  }))
  default = {
    core-api-service = {
      description        = "The core microservice API for business logic.",
      visibility         = "private",
      auto_init          = true,
      has_wiki           = false
      allow_merge_commit = false
      allow_squash_merge = true
      allow_rebase_merge = true
    },
    docs-portal = {
      description        = "Public documentation hub for API specifications.",
      visibility         = "public",
      auto_init          = true,
      has_wiki           = true
      allow_merge_commit = false
      allow_squash_merge = true
      allow_rebase_merge = true
    },
    asset-hub = {
      description        = "Centralized repository for shared application assets.",
      visibility         = "private",
      auto_init          = true,
      has_wiki           = false
      allow_merge_commit = false
      allow_squash_merge = true
      allow_rebase_merge = true
    }
  }
}

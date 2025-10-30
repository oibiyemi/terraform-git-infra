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

variable "repo_configs" {
  description = "Configuration map for GitHub repositories"
  type = map(object({
    description        = string,
    visibility         = string,
    auto_init          = bool,
    has_wiki           = bool,
    allow_merge_commit = bool,
    allow_squash_merge = bool,
    allow_rebase_merge = bool,
    enable_pages       = bool,
    repo_file = object({
      branch = string,
      file   = string,
      content = object({
        file_title = string,
        repo_name  = string,
        author     = string,
      }),
      commit_message      = string,
      overwrite_on_create = bool,

    })
  }))
}

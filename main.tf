# Repo Resource Block

resource "github_repository" "repos" {
  for_each    = var.repo_configs
  name        = each.key
  description = each.value.description

  visibility         = each.value.visibility
  auto_init          = each.value.auto_init
  allow_merge_commit = each.value.allow_merge_commit # disable default button
  allow_squash_merge = each.value.allow_squash_merge # To keep history readable
  allow_rebase_merge = each.value.allow_rebase_merge # Keep a clean history
  has_wiki           = each.value.has_wiki

  # Dynamic Block for Github Pages
  dynamic "pages" {
    for_each = each.value.enable_pages ? [1] : []
    content {
      source {
        branch = "main"
        path   = "/" # Uses root directory for content
      }
    }
  }
}






# Resource Block for Repo Files
resource "github_repository_file" "repo_file" {
  for_each   = var.repo_configs
  repository = github_repository.repos[each.key].name
  branch     = each.value.repo_file.branch
  file       = each.value.repo_file.file
  content = templatefile("${path.module}/templates/template.tftpl", {
    title    = each.value.repo_file.content.file_title,
    repo_key = each.value.repo_file.content.repo_name,
    author   = each.value.repo_file.content.author
    visibility = each.value.visibility }
  )
  commit_message      = each.value.repo_file.commit_message
  overwrite_on_create = each.value.repo_file.overwrite_on_create
  depends_on          = [github_repository.repos]

}

# Repo Resource Block

resource "github_repository" "repos" {
  for_each    = var.repo_config
  name        = each.key
  description = each.value.description

  visibility         = each.value.visibility
  auto_init          = each.value.auto_init
  allow_merge_commit = each.value.allow_merge_commit # disables default merge button
  allow_squash_merge = each.value.allow_squash_merge # keeps commit history readable
  allow_rebase_merge = each.value.allow_rebase_merge # Keeps a clean commit history
  has_wiki           = each.value.has_wiki
}

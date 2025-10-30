output "repo_deliverables" {
  value = { for k, v in github_repository.repos : k => {
    http_url = v.http_clone_url,
    page_url = try(v.pages[0].html_url, "no pages")
  } }
  description = "Outputs map containing key access points"
}

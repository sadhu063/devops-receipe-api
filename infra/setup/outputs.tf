output "cd_user_access_key_id" {
  value       = aws_iam_access_key.cd.id
  description = "AWS key ID for CD user"
}

output "cd_user_access_key_secret" {
  value       = aws_iam_access_key.cd.secret
  description = "AWS key secret for CD user"
  sensitive   = true
}


output "ecr_repo_app" {
  description = "ecr repository url for app image"
  value       = aws_ecr_repository.app.repository_url
}

output "ecr_repo_proxy" {
  description = "ecr repository url for app image"
  value       = aws_ecr_repository.proxy.repository_url
}

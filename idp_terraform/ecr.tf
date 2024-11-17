resource "aws_ecr_repository" "nd_github_actions_app" {
  name = "nd-github-actions-app"
}

resource "aws_ecr_repository_policy" "nd_github_actions_app" {
  repository = aws_ecr_repository.nd_github_actions_app.name
  policy = file("ecr_policy.json")
}

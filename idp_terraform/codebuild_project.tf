resource "aws_codebuild_project" "github_project" {
  name          = "github_project"
  description   = "A sample project for GitHub"
  service_role  = aws_iam_role.codebuild_service_role.arn
  build_timeout = 60

  source {
    type            = "GITHUB"
    location        = "https://github.com/srhoton/nd-github-actions-app"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
    type                        = "LINUX_CONTAINER"
    environment_variable {
      name  = "ENV"
      value = "value"
    }
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
}

resource "aws_codebuild_webhook" "github_webhook" {
  project_name = aws_codebuild_project.github_project.name
  build_type = "BUILD"
  filter_group {
    filter {
      pattern = "WORKFLOW_JOB_QUEUED"
      type    = "EVENT"
    }
  }
}

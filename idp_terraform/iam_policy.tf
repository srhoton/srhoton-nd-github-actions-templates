resource "aws_iam_policy" "connection_policy" {
  name        = "codebuild-connection-policy"
  description = "Policy for the Connection to Github app"
  policy      = file("connection_policy.json")
}
resource "aws_iam_policy" "service_role_policy" {
  name        = "codebuild-service-role-policy"
  description = "Policy for the Service Role for CodeBuild"
  policy      = file("service_role_policy.json")
}
resource "aws_iam_policy" "sts_policy" {
  name        = "sts-policy"
  description = "Policy for the STS role for the other environments"
  policy      = file("sts_policy.json")
  
}

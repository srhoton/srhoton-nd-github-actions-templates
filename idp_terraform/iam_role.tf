resource "aws_iam_role" "codebuild_service_role" {
  name = "codebuild-service-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codebuild.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF 
}

resource "aws_iam_role_policy_attachment" "connection_attachment" {
  role = aws_iam_role.codebuild_service_role.name
  policy_arn = aws_iam_policy.connection_policy.arn
}

resource "aws_iam_role_policy_attachment" "service_attachment" {
  role = aws_iam_role.codebuild_service_role.name
  policy_arn = aws_iam_policy.service_role_policy.arn
}

resource "aws_iam_role_policy_attachment" "sts_attachment" {
  role = aws_iam_role.codebuild_service_role.name
  policy_arn = aws_iam_policy.sts_policy.arn
  
}

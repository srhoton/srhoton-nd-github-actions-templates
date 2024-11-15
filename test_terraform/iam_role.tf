resource "aws_iam_role" "codebuild_service_role" {
  name = "codebuild-service-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::705740530616:role/codebuild-service-role"
            },
            "Action": [
              "sts:AssumeRole",
              "sts:TagSession"
            ]
        }
    ]
}
EOF 
}

resource "aws_iam_role_policy_attachment" "connection_attachment" {
  role = aws_iam_role.codebuild_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

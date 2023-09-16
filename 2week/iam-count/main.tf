locals {
  roles = [
    { name : "admin", policy : "arn:aws:iam::aws:policy/AdministratorAccess" },
    { name : "user", policy : "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess" },
    { name : "viewer", policy : "arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess" }
  ]
}

resource "aws_iam_role" "example" {
  count = length(local.roles)

  name = local.roles[count.index].name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "example" {
  count = length(local.roles)

  role       = aws_iam_role.example[count.index].name
  policy_arn = local.roles[count.index].policy
}


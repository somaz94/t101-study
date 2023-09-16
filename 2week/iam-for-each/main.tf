variable "roles" {
  description = "Roles and their respective policies"
  default = {
    admin   = "arn:aws:iam::aws:policy/AdministratorAccess"
    user    = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
    viewer  = "arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess"
  }
}

resource "aws_iam_role" "example" {
  for_each = var.roles

  name = each.key
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "example" {
  for_each = var.roles

  role       = aws_iam_role.example[each.key].name
  policy_arn = each.value
}

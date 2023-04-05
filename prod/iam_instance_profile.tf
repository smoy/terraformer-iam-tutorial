resource "aws_iam_instance_profile" "tfer--sample-app-role-prod" {
  name = "sample-app-role-prod"
  path = "/"
  role = "sample-app-role-prod"
}

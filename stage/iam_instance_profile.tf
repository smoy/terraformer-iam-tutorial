resource "aws_iam_instance_profile" "tfer--sample-app-role-stage" {
  name = "sample-app-role-stage"
  path = "/"
  role = "sample-app-role-stage"
}

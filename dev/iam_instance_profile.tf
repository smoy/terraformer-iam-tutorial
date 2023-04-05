resource "aws_iam_instance_profile" "tfer--import-sensor" {
  name = "import-sensor"
  path = "/"
  role = "import-sensor"
}

resource "aws_iam_instance_profile" "tfer--sample-app-role-dev" {
  name = "sample-app-role-dev"
  path = "/"
  role = "sample-app-role-dev"
}

resource "aws_iam_user" "tfer--AIDA57VSS6MB7FW372HK2" {
  force_destroy = "false"
  name          = "alice"
  path          = "/"
}

resource "aws_iam_user" "tfer--AIDA57VSS6MB7UNQHUKAE" {
  force_destroy = "false"
  name          = "bob"
  path          = "/"
}

resource "aws_iam_user" "tfer--AIDA57VSS6MBUU3K6AWZS" {
  force_destroy = "false"
  name          = "charlie"
  path          = "/"
}

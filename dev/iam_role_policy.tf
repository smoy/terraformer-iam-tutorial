resource "aws_iam_role_policy" "tfer--IambicSpokeRole_base_permissions" {
  name = "base_permissions"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:Describe*",
        "identitystore:*",
        "organizations:describe*",
        "organizations:list*",
        "iam:*",
        "sso:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    },
    {
      "Action": [
        "secretsmanager:CreateSecret",
        "secretsmanager:GetSecretValue",
        "secretsmanager:describesecret",
        "secretsmanager:listsecrets",
        "secretsmanager:listsecretversionids",
        "secretsmanager:PutSecretValue"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:secretsmanager:*:*:secret:iambic-config-secrets-*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "IambicSpokeRole"
}

resource "aws_iam_role_policy" "tfer--update_role_description-role-j21873m9_update-role-description" {
  name = "update-role-description"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "iam:UpdateRoleDescription",
      "Effect": "Allow",
      "Resource": "arn:aws:iam::961373467395:role/import-sensor",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "update_role_description-role-j21873m9"
}

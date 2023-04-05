resource "aws_iam_role_policy" "tfer--IambicHubRole_assume_spoke_role" {
  name = "assume_spoke_role"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:assumerole"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:iam::*:role/IambicSpokeRole"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "IambicHubRole"
}

resource "aws_iam_role_policy" "tfer--IambicHubRole_list_spoke_account_info" {
  name = "list_spoke_account_info"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "organizations:ListAccounts",
        "organizations:ListTagsForResource"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "IambicHubRole"
}

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

resource "aws_iam_role_policy" "tfer--iambic_github_app_lambda_execution_github-app" {
  name = "github-app"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:*:659751573789:*"
      ],
      "Sid": "CreateLogGroup"
    },
    {
      "Action": [
        "secretsmanager:GetSecretValue"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:secretsmanager:*:659751573789:secret:iambic/github-app-private-key",
        "arn:aws:secretsmanager:*:659751573789:secret:iambic/github-app-private-key-*",
        "arn:aws:secretsmanager:*:659751573789:secret:iambic/github-app-webhook-secret",
        "arn:aws:secretsmanager:*:659751573789:secret:iambic/github-app-webhook-secret-*"
      ],
      "Sid": "SecretReading"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:*:659751573789:log-group:/aws/lambda/iambic_github_app_webhook*:*"
      ],
      "Sid": "LogEvents"
    },
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Resource": "arn:aws:iam::659751573789:role/IambicHubRole"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "iambic_github_app_lambda_execution"
}

resource "aws_iam_role" "tfer--AWSReservedSSO_AdministratorAccess_c46a6fdefb24c150" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRoleWithSAML",
        "sts:TagSession"
      ],
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::659751573789:saml-provider/AWSSSO_e8e34dddf617d5d9_DO_NOT_DELETE"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "43200"
  name                 = "AWSReservedSSO_AdministratorAccess_c46a6fdefb24c150"
  path                 = "/aws-reserved/sso.amazonaws.com/us-west-2/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForCloudFormationStackSetsOrgAdmin" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "stacksets.cloudformation.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Service linked role for CloudFormation StackSets (Organization Admin)"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/CloudFormationStackSetsOrgAdminServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForCloudFormationStackSetsOrgAdmin"
  path                 = "/aws-service-role/stacksets.cloudformation.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForOrganizations" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "organizations.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Service-linked role used by AWS Organizations to enable integration of other AWS services with Organizations."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForOrganizations"
  path                 = "/aws-service-role/organizations.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForSSO" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "sso.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Service-linked role used by AWS SSO to manage AWS resources, including IAM roles, policies and SAML IdP on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForSSO"
  path                 = "/aws-service-role/sso.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForSupport" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "support.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Enables resource access for AWS to provide billing, administrative and support services"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForSupport"
  path                 = "/aws-service-role/support.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForTrustedAdvisor" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "trustedadvisor.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForTrustedAdvisor"
  path                 = "/aws-service-role/trustedadvisor.amazonaws.com/"
}

resource "aws_iam_role" "tfer--IambicHubRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:sts::659751573789:assumed-role/AWSReservedSSO_AdministratorAccess_c46a6fdefb24c150/smoy"
      }
    },
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::659751573789:role/iambic_github_app_lambda_execution"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description = "This role is used by IAMbic to assume into the spoke role of every account defined in the IAMbic config. Managed via CloudFormation."

  inline_policy {
    name   = "assume_spoke_role"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"sts:assumerole\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:iam::*:role/IambicSpokeRole\"]}]}"
  }

  inline_policy {
    name   = "list_spoke_account_info"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"organizations:ListAccounts\",\"organizations:ListTagsForResource\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }

  max_session_duration = "3600"
  name                 = "IambicHubRole"
  path                 = "/"
}

resource "aws_iam_role" "tfer--IambicSpokeRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::659751573789:role/IambicHubRole"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description = "This role is used by IAMbic to perform all actions on the account. It is assumed by the Iambic hub role in the hub account. Managed via CloudFormation."

  inline_policy {
    name   = "base_permissions"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:Describe*\",\"identitystore:*\",\"organizations:describe*\",\"organizations:list*\",\"iam:*\",\"sso:*\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]},{\"Action\":[\"secretsmanager:CreateSecret\",\"secretsmanager:GetSecretValue\",\"secretsmanager:describesecret\",\"secretsmanager:listsecrets\",\"secretsmanager:listsecretversionids\",\"secretsmanager:PutSecretValue\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:secretsmanager:*:*:secret:iambic-config-secrets-*\"]}]}"
  }

  managed_policy_arns  = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  max_session_duration = "3600"
  name                 = "IambicSpokeRole"
  path                 = "/"
}

resource "aws_iam_role" "tfer--iambic_github_app_lambda_execution" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description = "Github App Lambda Execution"

  inline_policy {
    name   = "github-app"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:logs:*:659751573789:*\"],\"Sid\":\"CreateLogGroup\"},{\"Action\":[\"secretsmanager:GetSecretValue\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:secretsmanager:*:659751573789:secret:iambic/github-app-private-key\",\"arn:aws:secretsmanager:*:659751573789:secret:iambic/github-app-private-key-*\",\"arn:aws:secretsmanager:*:659751573789:secret:iambic/github-app-webhook-secret\",\"arn:aws:secretsmanager:*:659751573789:secret:iambic/github-app-webhook-secret-*\"],\"Sid\":\"SecretReading\"},{\"Action\":[\"logs:CreateLogStream\",\"logs:PutLogEvents\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:logs:*:659751573789:log-group:/aws/lambda/iambic_github_app_webhook*:*\"],\"Sid\":\"LogEvents\"},{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::659751573789:role/IambicHubRole\"}]}"
  }

  max_session_duration = "3600"
  name                 = "iambic_github_app_lambda_execution"
  path                 = "/"
}

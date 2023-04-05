resource "aws_iam_role" "tfer--AWSReservedSSO_AdministratorAccess_a8b8dc74ce313286" {
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
        "Federated": "arn:aws:iam::961373467395:saml-provider/AWSSSO_ec24901780963bd5_DO_NOT_DELETE"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "43200"
  name                 = "AWSReservedSSO_AdministratorAccess_a8b8dc74ce313286"
  path                 = "/aws-reserved/sso.amazonaws.com/us-west-2/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForCloudFormationStackSetsOrgMember" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "member.org.stacksets.cloudformation.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Service linked role for CloudFormation StackSets (Organization Member)"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/CloudFormationStackSetsOrgMemberServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForCloudFormationStackSetsOrgMember"
  path                 = "/aws-service-role/member.org.stacksets.cloudformation.amazonaws.com/"
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

resource "aws_iam_role" "tfer--Amazon_EventBridge_Scheduler_LAMBDA_0a11868946" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "aws:SourceAccount": "961373467395"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Service": "scheduler.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::961373467395:policy/service-role/Amazon-EventBridge-Scheduler-Execution-Policy-3cbacae5-aec0-4f7d-8225-e4c971c46e18"]
  max_session_duration = "3600"
  name                 = "Amazon_EventBridge_Scheduler_LAMBDA_0a11868946"
  path                 = "/service-role/"
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

resource "aws_iam_role" "tfer--OrganizationAccountAccessRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::659751573789:root"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "3600"
  name                 = "OrganizationAccountAccessRole"
  path                 = "/"
}

resource "aws_iam_role" "tfer--import-sensor" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "2023-04-05T22:00:19.963188"
  max_session_duration = "3600"
  name                 = "import-sensor"
  path                 = "/"
}

resource "aws_iam_role" "tfer--sample-app-role-dev" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows EC2 instances to call AWS services on your behalf."
  max_session_duration = "3600"
  name                 = "sample-app-role-dev"
  path                 = "/"
}

resource "aws_iam_role" "tfer--stacksets-exec-3a13bad69ee5cf8afa9722d7c9573dc1" {
  assume_role_policy = <<POLICY
{
  "Id": "stacksets-exec-3a13bad69ee5cf8afa9722d7c9573dc1-assume-role-policy",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::659751573789:role/aws-service-role/stacksets.cloudformation.amazonaws.com/AWSServiceRoleForCloudFormationStackSetsOrgAdmin"
      },
      "Sid": "1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Role created by AWSCloudFormation StackSets"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "3600"
  name                 = "stacksets-exec-3a13bad69ee5cf8afa9722d7c9573dc1"
  name_prefix          = "stacksets-exec-3a13ba"
  path                 = "/"
}

resource "aws_iam_role" "tfer--update_role_description-role-j21873m9" {
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

  inline_policy {
    name   = "update-role-description"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"iam:UpdateRoleDescription\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::961373467395:role/import-sensor\",\"Sid\":\"VisualEditor0\"}]}"
  }

  managed_policy_arns  = ["arn:aws:iam::961373467395:policy/service-role/AWSLambdaBasicExecutionRole-78a8ff97-2ce1-463c-8ade-3ebefaa55e39"]
  max_session_duration = "3600"
  name                 = "update_role_description-role-j21873m9"
  path                 = "/service-role/"
}

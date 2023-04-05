resource "aws_iam_role_policy_attachment" "tfer--AWSReservedSSO_AdministratorAccess_a8b8dc74ce313286_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "AWSReservedSSO_AdministratorAccess_a8b8dc74ce313286"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForCloudFormationStackSetsOrgMember_CloudFormationStackSetsOrgMemberServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/CloudFormationStackSetsOrgMemberServiceRolePolicy"
  role       = "AWSServiceRoleForCloudFormationStackSetsOrgMember"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForOrganizations_AWSOrganizationsServiceTrustPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"
  role       = "AWSServiceRoleForOrganizations"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSSO_AWSSSOServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"
  role       = "AWSServiceRoleForSSO"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSupport_AWSSupportServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  role       = "AWSServiceRoleForSupport"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForTrustedAdvisor_AWSTrustedAdvisorServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  role       = "AWSServiceRoleForTrustedAdvisor"
}

resource "aws_iam_role_policy_attachment" "tfer--Amazon_EventBridge_Scheduler_LAMBDA_0a11868946_Amazon-EventBridge-Scheduler-Execution-Policy-3cbacae5-aec0-4f7d-8225-e4c971c46e18" {
  policy_arn = "arn:aws:iam::961373467395:policy/service-role/Amazon-EventBridge-Scheduler-Execution-Policy-3cbacae5-aec0-4f7d-8225-e4c971c46e18"
  role       = "Amazon_EventBridge_Scheduler_LAMBDA_0a11868946"
}

resource "aws_iam_role_policy_attachment" "tfer--IambicSpokeRole_ReadOnlyAccess" {
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role       = "IambicSpokeRole"
}

resource "aws_iam_role_policy_attachment" "tfer--OrganizationAccountAccessRole_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "OrganizationAccountAccessRole"
}

resource "aws_iam_role_policy_attachment" "tfer--stacksets-exec-3a13bad69ee5cf8afa9722d7c9573dc1_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "stacksets-exec-3a13bad69ee5cf8afa9722d7c9573dc1"
}

resource "aws_iam_role_policy_attachment" "tfer--update_role_description-role-j21873m9_AWSLambdaBasicExecutionRole-78a8ff97-2ce1-463c-8ade-3ebefaa55e39" {
  policy_arn = "arn:aws:iam::961373467395:policy/service-role/AWSLambdaBasicExecutionRole-78a8ff97-2ce1-463c-8ade-3ebefaa55e39"
  role       = "update_role_description-role-j21873m9"
}

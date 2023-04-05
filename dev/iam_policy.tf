resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-78a8ff97-2ce1-463c-8ade-3ebefaa55e39" {
  name = "AWSLambdaBasicExecutionRole-78a8ff97-2ce1-463c-8ade-3ebefaa55e39"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:us-east-1:961373467395:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:961373467395:log-group:/aws/lambda/update_role_description:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--Amazon-EventBridge-Scheduler-Execution-Policy-3cbacae5-aec0-4f7d-8225-e4c971c46e18" {
  name = "Amazon-EventBridge-Scheduler-Execution-Policy-3cbacae5-aec0-4f7d-8225-e4c971c46e18"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "lambda:InvokeFunction"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:lambda:us-east-1:961373467395:function:update_role_description:*",
        "arn:aws:lambda:us-east-1:961373467395:function:update_role_description"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

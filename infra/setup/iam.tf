################################################################
# create IAM user and policy for Continous deploy (CD) Account #
################################################################
resource "aws_iam_user" "cd" {
  name = "recipe-app-api-cd"
}

resource "aws_iam_access_key" "cd" {
  user = aws_iam_user.cd.name
}

#########################################################
# policy for terraform backend s3 and dynamo DB access  #
#########################################################

data "aws_iam_policy_document" "tf_backend" {
  statement {
    effect    = "Allow"
    actions   = ["s3:listBucket"]
    resources = ["arn:aws:s3:::${var.tf_state_bucket}"]
  }
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = ["arn:aws:s3:::${var.tf_state_bucket}/tf-state-deploy/*",
    "arn:aws:s3:::${var.tf_state_bucket}/tf-state-deploy-env/*"]
  }

  statement {
    effect = "Allow"
    actions = ["dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
    "dynamodb:DeleteItem"]
    resources = ["arn:aws:dynamodb:*:*:table/${var.tf_state_lock-table}"
    ]
  }
}



resource "aws_iam_policy" "tf_backend" {
  policy      = data.aws_iam_policy_document.tf_backend.json
  description = "allow user to use s3 and dynamodb for TF backend resources"
  name        = "${aws_iam_user.cd.name}-tf-s3-dynamodb"
}


resource "aws_iam_user_policy_attachment" "tf_backend" {
  user       = aws_iam_user.cd.name
  policy_arn = aws_iam_policy.tf_backend.arn
}


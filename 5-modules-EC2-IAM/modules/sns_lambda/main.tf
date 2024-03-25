resource "aws_sns_topic" "example" {
  name = var.sns_topic_name
}



resource "aws_sns_topic_subscription" "example_email_subscription" {
  for_each = toset(var.email_subscription)
  topic_arn = aws_sns_topic.example.arn
  protocol  = "email"
  endpoint  = each.value
}


resource "aws_lambda_function" "example_lambda" {
  filename         = "${path.module}/lambda_function.zip"

  function_name    = var.lambda_name
  role             = var.lambda_role_arn
  handler          = "index.handler"
  //source_code_hash = filebase64sha256("lambda_function.zip")
  runtime          = "nodejs20.x"

  environment {
    variables = {
      SNS_TOPIC_ARN = aws_sns_topic.example.arn
    }
  }
}

resource "aws_lambda_permission" "sns" {
  statement_id = "AllowExecutionFromSNS"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.example_lambda.function_name
  principal = "sns.amazonaws.com"
  source_arn = aws_sns_topic.example.arn
}
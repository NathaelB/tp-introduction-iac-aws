output "sns_topic_arn" {
  value = aws_sns_topic.example_topic.arn
  description = "The ARN of the created SNS topic."
}

output "lambda_function_arn" {
  value = aws_lambda_function.example_lambda.arn
  description = "The ARN of the created Lambda function."
}
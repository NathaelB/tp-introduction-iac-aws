variable "sns_topic_name" {
  type = string
  description = "The name of the SNS topic"
}

variable "email_subscription" {
  type = list(string)
  description = "Email addresses to subscribe to the SNS topic."
}

variable "lambda_name" {
  type = string
  description = "The name of the Lambda function"
}

variable "lambda_role_arn" {
  type = string
  description = "The ARN of the IAM role to use for the Lambda function"
}

variable "notification_message" {
  type = string
  description = "The message to send to the SNS topic"
}


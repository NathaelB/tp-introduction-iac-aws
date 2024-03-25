variable "sns_arn" {
  description = "The ARN of the SNS topic to send notifications"
  type = string
}

variable "threshold" {
  description = "The threshold for the CloudWatch alarm"
  type = number
}
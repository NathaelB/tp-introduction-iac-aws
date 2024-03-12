variable "instance_name" {
  type        = string
  description = "Name of the EC2 instance."
}

variable "instance_type" {
  type        = string
  description = "Instance type of the EC2 instance."
  default     = "t3.nano"
}

variable "user_data" {
  type        = string
  description = "User data to initialize the EC2 instance."
  default     = ""
}

variable "instance_role_name" {
  type        = string
  description = "The name of the IAM role attached to the EC2 instance."
}
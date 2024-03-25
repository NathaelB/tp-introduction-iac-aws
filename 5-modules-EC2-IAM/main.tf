provider "aws" {
  region = "us-east-1"
}

module "ec2_instances" {
  source = "./modules/ec2"
  for_each = {
    instance1 = { name = "EC2Prout1", type = "t3.micro" },
    instance2 = { name = "EC2Prout2", type = "t3.micro" },
    instance3 = { name = "TristanProut", type = "t3.micro" },

  }

  instance_name = each.value.name
  instance_type = each.value.type
  user_data = ""
  instance_role_name = "LabInstanceProfile"
}

module "sns" {
  source = "./modules/sns_lambda"
  email_subscription = ["pro.nathaelbonnal@gmail.com", "nathael.bonnal@oomade.com"]
  lambda_name = "ProutLambda"
  lambda_role_arn = "arn:aws:iam::851725207850:role/LabRole"
  notification_message = "Prout"
  sns_topic_name = "ProutTopic"
}

module "notification" {
  source = "./modules/watch"
  sns_arn = module.sns.sns_topic_arn
  threshold = 3
}
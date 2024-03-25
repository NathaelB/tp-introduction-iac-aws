module "ec2" {
  source = "./modules/ec2"

  instance_name = "ProutEC2"
  instance_type = "t2.micro" // Ou tout autre type que vous souhaitez
  user_data     = ""      // Si vous avez besoin de spécifier un script d'initialisation
  instance_role_name = "LabRole"
}

module "sns_lambda" {
  source = "./modules/sns-lambda"

  sns_topic_name       = "mon-topic-sns"
  email_subscription   = "monemail@example.com"
  lambda_name          = "MaFonctionLambda"
  lambda_role_arn      = "arn:aws:iam::851725207850:user/awsstudent" // Remplacer par le véritable ARN de votre rôle IAM
}
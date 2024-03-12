module "ec2_instances" {
  source = "./modules/ec2"
  for_each = {
    instance1 = { name = "EC2Prout1", type = "t3.micro" },
  }

  instance_name = each.value.name
  instance_type = each.value.type
  user_data = ""
  instance_role_name = ""
}
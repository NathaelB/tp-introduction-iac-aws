resource "aws_instance" "example" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  user_data = var.user_data

  tags = {
    Name = var.instance_name
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
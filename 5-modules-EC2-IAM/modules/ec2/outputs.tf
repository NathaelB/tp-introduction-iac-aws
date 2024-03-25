output "instance_id" {
  value = aws_instance.example.id
  description = "The ID of the created EC2 instance."
}

output "public_ip" {
  value = aws_instance.example.public_ip
  description = "The EC2 public IP"
}
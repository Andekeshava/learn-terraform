output "aws_instance_output" {
  value = aws_instance.roboshop[0].private_ip
}
resource "aws_instance" "data_source" {
    instance_type = var.instance_type
    ami = data.aws_ami.devops.id
    vpc_security_group_ids = [aws_security_group.data_source.id]

    tags = var.ec2_tags
}

resource "aws_security_group" "data_source" {
  name = "roboshop-data-demo"
  description = "allows inbond and outbond traffic "

  ingress{
    from_port = var.from_port
    to_port = var.from_port
    protocol = "tcp"
    cidr_blocks = var.cidr
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-data-source"
  }

}
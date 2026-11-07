resource "aws_instance" "mongodb" {
    instance_type = var.instance_type
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.mongodb.id]

    tags = var.ec2_tags
}

resource "aws_security_group" "mongodb" {
  name = "mongodb"
  description = "allows inbond and outbond traffic "

  ingress{
    from_port = var.from_port
    to_port = var.to_port
    protocol = "-1"
    cidr_blocks = var.cidr_block
  }

  egress{
    from_port = var.from_port
    to_port = var.to_port
    protocol = "-1"
    cidr_blocks = var.cidr_block
  }

  tags = {
    Name = "roboshop-mongodb"
  }

}
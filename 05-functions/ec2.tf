resource "aws_instance" "roboshop" {
    instance_type = "t3.micro"
    ami = "ami-0055977a6e828a4f4"
    vpc_security_group_ids = [aws_security_group.roboshop.id]

    tags = merge(
      var.common-vars, {
          Name = "functions-demo"
          component = "poc"
        }
    )   
}

resource "aws_security_group" "roboshop" {
  name = "web"
  description = "allows inbond and outbond traffic "

  ingress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common-vars, {
      Name = "functions-sg"
      description = "common sg demo for functions"
    }
  )

}
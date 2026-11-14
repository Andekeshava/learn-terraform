resource "aws_security_group" "roboshop" {
  name = "dynamic-sg"
  description = "this is dynamic sg demo"

  dynamic "ingress" {  #terraform will give block name as special variable in terraform
  for_each = var.ingress_rules
    content {
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = "tcp"
        cidr_blocks = ingress.value.cidr_block
        description = ingress.value.description
        }
  }
   
   egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]
     description = "vmdkvmdkvnfv"
   }

   tags = {
    Name: "dynamic-sg"
   }
}
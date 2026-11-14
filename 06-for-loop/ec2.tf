resource "aws_instance" "roboshop" {
    for_each = var.instances
    instance_type = each.value.instance_type
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.common.id, aws_security_group.roboshop[each.key].id]

    tags = {
        Name = "${var.project}-${var.environment}-${each.key}"
    }
}

resource "aws_security_group" "common" {
  name = "${var.project}-${var.environment}-common"
  description = "common SG for all the components created "

  egress{
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}-common"
  }

}

resource "aws_security_group" "roboshop" {
  for_each = var.instances
  name = "${var.project}-${var.environment}-${each.key}"
  description = "component SG for the roboshop is created "

  #ingress block
  ingress {
    from_port = each.value.port_no
    to_port = each.value.port_no
    protocol = "tcp"
    cidr_blocks = each.value.cidr_block
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}-${each.key}"
  }

}
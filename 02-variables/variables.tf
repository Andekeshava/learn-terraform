variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "ami id which is string"
  
}

variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "Instance type passed as variable"
}

variable "ec2_tags" {
  type = map
  default = {
    Name: "roboshop-mongodb"
    Environment: "dev"
    Terraform = "true"
    Project = "roboshop"
    Component = "mongodb"
  }
}

variable "cidr_block" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "to_port" {
  type = number
  default = 0
}

variable "from_port" {
  type = number
  default = 0
}
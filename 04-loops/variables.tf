variable "environment" {
  default = "dev"
}

variable "project" {
    default = "roboshop"
}

variable "instance_type" {
    default = "t3.micro"

validation {
    condition = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
    error_message = "Instance must be one the among t3.small, t3.micro, t3.medium, t3.large"
}
}

variable "ami_id" {
    default = "ami-0055977a6e828a4f4"
}

variable "instances" {
    default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
}


variable "zone_id" {
    default = "Z021725625Q0QW58HS52C"
  
}

variable "domain_name" {
    default = "jkrdigital.store"
}
# variable "ec2_tags" {
#   type = map
#   default = {
#     Name: "roboshop-mongodb"
#     Environment: "dev"
#     Terraform = "true"
#     Project = "roboshop"
#     Component = "mongodb"
#   }
# }

# variable "cidr_block" {
#     type = list
#     default = ["0.0.0.0/0"]
# }

# variable "to_port" {
#   type = number
#   default = 0
# }

# variable "from_port" {
#   type = number
#   default = 0
# }
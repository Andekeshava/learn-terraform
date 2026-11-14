
variable  "instance_type" {
  type        = map
  default = {
    dev = "t3.micro"
    uat = "t3.small"
    prod = "t3.medium"
  }

#   validation {
#     # Returns true if var.enviroinstance_typenment is one of the items in the list
#     condition     = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
#     error_message = "Instance type must be one of t3.small, t3.micro, t3.medium or t3.large."
#   }
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "roboshop-workspace-demo"
        Environment = "dev"
        Terraform = "true"
        Project = "roboshop"
    }
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    type = number
    default = 0
}
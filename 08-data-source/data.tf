data "aws_ami" "devops" {
  most_recent = true
  owners      = ["298363283580"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

output "ami_id" {
  value = data.aws_ami.devops.id
}


# data "aws_ami" "keshava" {
#     most_recent = true
#     owners      = ["298363283580"]

#     filter {
#         name   = "name"
#         values = ["Redhat-9-DevOps-Practice"]
#     }

#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }
  
# }

# output "ami_id" {
#   value       = data.aws_ami.keshava.id
# }
variable "ingress_rules" {
  default = {
    ssh = {
        from_port = 22
        to_port = 22
        cidr_block = ["0.0.0.0/0"]
        description = "This is ssh port common for all the services"
    }
    http = {
        from_port = 80
        to_port = 80
        cidr_block = ["0.0.0.0/0"]
        description = "this is open port for all for web access"
    }
    mysql = {
        from_port = 3306
        to_port =3306
        cidr_block = ["0.0.0.0/0"]
        description = "this is open port for all the db access"
    }
    tcp = {
        from_port = 8081
        to_port = 8081
        cidr_block = ["0.0.0.0/0"]
        description = "open for all the custom related protocol"
    }
  }
}
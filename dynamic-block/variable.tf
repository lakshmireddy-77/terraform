variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "sg_name" {
  type = string
  default = "allow-all-dynamic-block"
}

variable "from_port" {
    type = number
    default = 0
  
}
variable "to_port" {
    type = number
    default = 0
  
}
variable "protocol" {
    type = string
    default = "-1"
  
}


variable "sg_tags" {
    type = map(string)
    default = {
      "Name" = "allow-all"
    }
  
}

variable "ec2_tags" {
    type = map(string)
    default = {
      Name = "hello-world"
    }
  
}
variable "ingress_ports" {
    default = [
        {
            from_port = 22
            to_port = 22
        },
        {
            from_port = 80
            to_port = 80
        },
        {
            from_port = 8080
            to_port = 8080
        }
    ]
  
}
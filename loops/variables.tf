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
  default = "files-allow-all-conditions"
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
      "Name" = "allow-all-loop"
    }
  
}

variable "ec2_tags" {
    type = map(string)
    default = {
      Name = "roboshop"
    }
  
}

variable "instances" {
    default = ["mongodb","redis","mysql","rabbitmq"]
  
}

variable "domain_name" {
    default = "lakshmireddy.site"
  
}
variable "zone_id" {
    default = "Z004919524VECNVRU6F0T"
  
}
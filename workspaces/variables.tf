variable "project" {
    default = "roboshop"
  
}



variable "common_tags" {
    default = {
        project = "roboshop"
        terraform= "true"
    }
  
}

variable "sg_name" {
  type = string
  default = "allow-all"
}

variable "sg_dis" {
    type = string
    default = "allow-all-traffic"
  
}
variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
  
}

variable "instance_type" {
    default = {
        dev = "t2.micro"
        prod = "t2.small"
    }
    
  
}
variable "instances" {
    default = ["mongodb","redis","mysql","rabbitmq"]
  
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
      "Name" = "allow-all-envi"
    }
}

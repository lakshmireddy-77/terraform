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
  default = "allow-all-data-sources"
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
      "Name" = "allow-all-variable"
    }
  
}

variable "ec2_tags" {
    type = map(string)
    default = {
      Name = "hello-world"
    }
  
}
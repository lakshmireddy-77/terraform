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
  default = "allow-all-traffic"
}
variable "from_port" {
    type = number
    default = 0
  
}
variable "to_port" {
    type = number
    default = 0
  
}

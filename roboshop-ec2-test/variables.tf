variable "security_group_ids" {
    default = ["sg-0bc84fbabd0ef84f2"]
  
}

variable "tags" {
    default = {
        Name = "roboshop-cart"
        terraform= "true"
        environment="dev"
    }
  
}

variable "instance_type" {
    default = "t2.small"
  
}
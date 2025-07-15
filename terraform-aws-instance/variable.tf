variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"

  
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  validation {
    condition = contains(["t2.micro","t2.small","t2.medium"],var.instance_type)
    error_message = "vaild instances types are: t2.micro,t2.medium,t2.small"
  }
}

variable "sg_ids" {
    type = list
  
}

variable "tags" {
    type = map
  
}
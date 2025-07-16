variable "cidr_block" {
    default = "10.0.0.0/16"
  
}
variable "project" {
    type = string
  
}
variable "environment" {
    type = string
  
}

variable "public_subnet_cidr" {
    type = list(string)
  
}
variable "public_subnet_tags" {
    type = map(string)
    default = {} # nt manatary
    
  
}

variable "private_subnet_cidr" {
    type = list(string)
  
}
variable "private_subnet_tags" {
    type = map(string)
    default = {} # nt manatary
    
  
}

variable "vpc_tags" {
    type = map(string)
    default = {} # nt manatary
    
  
}

variable "igw_tags" {
    type = map(string)
    default = {} # nt manatary
    

}
variable "database_subnet_cidr" {
    type = list(string)
  
}

variable "database_tags" {
    type = map(string)
    default = {} # nt manatary
    
  
}

variable "eip_tags" {
   type = map(string)
    default = {} # nt manatary
}

variable "nat_gateway_tags" {
   type = map(string)
    default = {} # nt manatary
}

variable "public_route_tags" {
  type = map(string)
    default = {}
}

variable "private_route_tags" {
  type = map(string)
    default = {}
}
variable "database_route_tags" {
  type = map(string)
    default = {}
}

variable "is_peering_required" {
    default = false
  
}
variable "vpc_peering_tags" {
  type = map(string)
    default = {}
}
variable "project" {
    default = "roboshop"
  
}

variable "environement" {
    default = "dev"
  
}

variable "component" {
    default = "cart"
  
}

# variable "final_name" {
#     default = "${var.project}-${var.environement}-${var.component}"
  
# }

# we will get one error 
#  Error: Variables not allowed, beacuse we one variables cannot refer another varaible


variable "common_tags" {
    default = {
        project = "roboshop"
        terraform= "true"
    }
  
}
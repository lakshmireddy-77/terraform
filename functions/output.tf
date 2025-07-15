output "sg_ids" {
    value = aws_security_group.allow_all
  
}

output "ec2_instance_info" {
    value = aws_instance.roboshop
  
}
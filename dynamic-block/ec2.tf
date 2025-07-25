resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids  = [aws_security_group.allow_all.id]
    tags = var.ec2_tags
  
}

resource "aws_security_group" "allow_all" { 
    name = var.sg_name 
    
    dynamic "ingress" {
        for_each = var.ingress_ports
        content {
        from_port = ingress.value["from_port"]
        to_port = ingress.value["to_port"]
       protocol = "tcp" # here we are using TCP ports
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        }
      
    }
    egress {
       from_port = var.from_port # we can give specfic ports
        to_port = var.to_port
       protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = var.sg_tags
  
}
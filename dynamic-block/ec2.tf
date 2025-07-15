resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids  = [aws_security_group.allow_all.id]
    tags = var.ec2_tags
  
}

resource "aws_security_group" "allow_all" { #allow all means this is for internal purpose
    name = var.sg_name # this is security gruop name , internal name
    
    dynamic "ingress" {
        for_each = var.ingress_ports
        content {
        from_port = ingress.value["from_port"]
        to_port = ingress.value["to_port"]
        protocol = var.protocol
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        }
      
    }
    egress {
       from_port = var.from_port # we can give specfic ports
        to_port = var.to_port
        protocol = var.protocol # allowing all protocols like TCP,HTTP,HTTPS
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = var.sg_tags
  
}
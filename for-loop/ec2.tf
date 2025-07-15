resource "aws_instance" "roboshop" {
    #for_each = var.instances
    for_each = toset(var.instances)
    ami = var.ami_id
    instance_type = "t2.micro"
    vpc_security_group_ids  = [aws_security_group.allow_all.id]
    tags = {
        Name = each.key
    }
    }

resource "aws_security_group" "allow_all" { #allow all means this is for internal purpose
    name = var.sg_name # this is security gruop name , internal name
    
    ingress {
        from_port = var.from_port # we can give specfic ports
        to_port = var.to_port
        protocol = var.protocol # allowing all protocols like TCP,HTTP,HTTPS
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
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
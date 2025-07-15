resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids  = [aws_security_group.allow_all.id]
    tags = var.ec2_tags

    provisioner "local-exec" {
        command = "${self.private_ip} > inventory"
        on_failure = continue
      
    }
    provisioner "local-exec" {
        command = "echo instance is destroyed"
        when = destroy
      
    }
    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip # connecting from laptop
    }
  provisioner "remote-exec" {
    inline = [ 
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
     ]
    
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [ 
        "sudo systemctl stop nginx"
     ]
    
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
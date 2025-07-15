resource "aws_instance" "roboshop" {
     count = length(var.instances)
    ami = var.ami_id
    instance_type = lookup(var.instance_type, terraform.workspace,"t3.small")
    vpc_security_group_ids  = [aws_security_group.allow_all.id]
    tags = merge(
        var.common_tags,
        {
            Name = "${var.instances[count.index]}-${terraform.workspace}"
            component = var.instances[count.index]
            environement= terraform.workspace
        }
    )
}

resource "aws_security_group" "allow_all" { #allow all means this is for internal purpose
    name = "${var.sg_name}-${terraform.workspace}" # this is security gruop name , internal name
    description = "${var.sg_dis}-${terraform.workspace}"
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
    tags = merge(
        var.common_tags,
        {
            Name = "${var.sg_name}-${terraform.workspace}"
        }
    )
  
}
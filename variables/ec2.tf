resource "aws_instance" "roboshop"{
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow-all.id]
}
resource "aws_security_group" "allow-all" {
    name = var.sg_name
    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks =  ["::/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks =  ["::/0"]
    }
  
}
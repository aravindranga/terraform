resource "aws_instance" "terraform" {

    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = var.tags.print
    
}

resource "aws_security_group" "allow_ssh_terraform" {
    name        = var.sg_name #allow_ssh is already there in my account
    description = var.sg_description 

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.ingress_cidr
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.tags
}

# resource "aws_instance" "terraform" {

#     ami = "ami-09c813fb71547fc4f"
#     instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    
#     tags = {
#         Name = "terraform"
#     }
# }
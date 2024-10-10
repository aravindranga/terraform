# resource "aws_instance" "terraform" {
#     count=3
#     ami = "ami-09c813fb71547fc4f"
#     # instance_type = var.environment == "prod" ? "t3.medium":"t3.small"
#     # instance_type="t3.micro"
#     instance_type = count.index == 0 ? "t3.micro":"t3.small"


#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    
#     tags = {
#         Name = var.instance_names[count.index]
#     }
            
# }

resource "aws_security_group" "allow_ssh_terraform" {
    name        = "allow_ssssh" #allow_ssh is already there in my account
    description ="Allow port number 22 for SSH access"

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
    Name = "allow_ssssh"
  }
}

# resource "aws_instance" "terraform" {

#     ami = "ami-09c813fb71547fc4f"
#     instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    
#     tags = {
#         Name = "terraform"
#     }
# }
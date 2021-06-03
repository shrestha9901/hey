provider "aws" {
  region = "ap-south-1"
}
# resource "aws_instance" "myec2" {
#    ami = "ami-0d5eff06f840b45e9"
#    instance_type = "t2.micro"
#    key_name = "key1"
#    vpc_security_group_ids  = [aws_security_group.allow_ssh.id]

#    provisioner "remote-exec" {
#      inline = [
#        "sudo amazon-linux-extras install -y nginx1.12",
#        "sudo systemctl start nginx"
#      ]

#    connection {
#      type = "ssh"
#      user = "ec2-user"
#      private_key = file("key1.pem")
#      host = self.public_ip
#    }
#    }
# }
# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "2.21.0"

#   name = var.vpc_name
#   cidr = var.vpc_cidr

#   azs             = var.vpc_azs
#   private_subnets = var.vpc_private_subnets
#   public_subnets  = var.vpc_public_subnets

#   enable_nat_gateway = var.vpc_enable_nat_gateway

#   tags = var.vpc_tags
# }

# module "ec2_instances" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "2.12.0"

#   name           = "my-ec2-cluster"
#   instance_count = 2

#   ami                    = "ami-0c5204531f799e0c6"
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [module.vpc.default_security_group_id]
#   subnet_id              = module.vpc.public_subnets[0]

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }
# ### NOTE - Adding a new security group resource to allow the terraform provisioner from laptop to connect to EC2 Instance via SSH.

# resource "aws_security_group" "allow_ssh" {
#   name        = "allow_ssh"
#   description = "Allow SSH inbound traffic"

#   ingress {
#     description = "SSH into VPC"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     description = "Outbound Allowed"
#     from_port   = 0
#     to_port     = 65535
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }


resource "aws_instance" "Ec2" {
  instance_type = lookup(var.imap, terraform.workspace)
  ami = var.ami_type
}
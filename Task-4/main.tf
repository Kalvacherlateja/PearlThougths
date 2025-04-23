provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "strapi1" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (update as needed)
  instance_type = "t2.micro"
  key_name      = "my-keypair"

  user_data = file("init.sh") # for Docker install and starting container

  tags = {
    Name = "StrapiServer"
  }

  security_groups = [aws_security_group.strapi1_sg.name]
}

resource "aws_security_group" "strapi1_sg" {
  name = "strapi1-sg"

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

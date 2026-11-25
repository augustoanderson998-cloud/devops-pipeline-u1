terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  # Configurações para permitir simulação local sem credenciais reais da AWS
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Grupo de seguranca para liberar portas web"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
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

resource "aws_instance" "app_server" {
  ami                    = "ami-0c7217cdde317cfec" # Amazon Linux 2
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = var.instance_name
  }
}

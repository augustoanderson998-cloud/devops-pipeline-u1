variable "aws_region" {
  description = "Regiao da AWS onde os recursos serao criados"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Nome da tag para a instancia EC2"
  type        = string
}

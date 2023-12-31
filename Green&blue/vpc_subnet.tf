provider "aws" {
  region = "us-east-1" # Substitua pela sua região AWS
}

# Crie uma VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

# criação das subnets privadas nas zonas de disponibilidade 1a e 1b

resource "aws_subnet" "private_subnet" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = element(["10.0.0.0/24", "10.0.1.0/24"], count.index)
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)
  map_public_ip_on_launch = false
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id
}
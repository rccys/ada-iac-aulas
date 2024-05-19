resource "aws_vpc" "ecs_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-${terraform.workspace}-vpc"
  }
}

resource "aws_subnet" "ecs_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.ecs_vpc.id
  cidr_block              = count.index == 0 ? "10.0.1.0/24" : "10.0.2.0/24"
  availability_zone       = count.index == 0 ? "us-east-1a" : "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-${terraform.workspace}-subnet-${count.index}"
  }
}
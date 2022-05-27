
provider "aws" {
  region  = "us-east-1"
}


resource "aws_vpc" "vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = "class-vpc"
    Environment = "dev"  }
}


resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "class-igw"
    Environment = "dev"
  }
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.ig]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public_subnet.*.id, 0)
  depends_on    = [aws_internet_gateway.ig]
  tags = {
    Name        = "nat"
    Environment = "dev"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = 1
  cidr_block              = "10.10.6.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "sub-${count.index+1}-public-subnet"
    Environment = "dev"
  }
}


output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets_id" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.public_subnet.*.id
}


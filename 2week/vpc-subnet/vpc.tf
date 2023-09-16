# VPC 생성
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # 예시 CIDR 블록

  tags = {
    Name = "main-vpc"
  }
}

# Availability Zones 데이터 선언
data "aws_availability_zones" "available" {
  state = "available"
}

# Primary 서브넷 생성
resource "aws_subnet" "primary" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"  # 예시 CIDR 블록
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "primary-subnet"
  }
}

# Secondary 서브넷 생성
resource "aws_subnet" "secondary" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"  # 예시 CIDR 블록
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "secondary-subnet"
  }
}

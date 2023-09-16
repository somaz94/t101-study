# vpc.tf

# VPC 생성
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16" # 예시 CIDR 블록

  tags = {
    Name = "somaz-vpc"
  }
}

# Availability Zones 데이터 선언
data "aws_availability_zones" "available" {
  state = "available"
}

# Primary 서브넷 생성
resource "aws_subnet" "primary" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24" # 예시 CIDR 블록
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "somaz-subnet1"
  }
}

# Secondary 서브넷 생성
resource "aws_subnet" "secondary" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24" # 예시 CIDR 블록
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "somaz-subnet2"
  }
}

# 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "somaz-igw"
  }
}

# 라우팅 테이블 생성 후 연결
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "somaz-rt"
  }
}

resource "aws_route_table_association" "rt_association1" {
  subnet_id      = aws_subnet.primary.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rt_association2" {
  subnet_id      = aws_subnet.secondary.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route" "main_route" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}


output "aws_vpc_id" {
  value = aws_vpc.main.id
}

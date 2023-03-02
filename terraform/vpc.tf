resource "aws_vpc" "mincraft_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "mincraft"
  }
}

resource "aws_subnet" "mincraft_public_subnet" {
  vpc_id            = aws_vpc.mincraft_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "mincraft-public-subnet"
  }
}

resource "aws_internet_gateway" "mincraft_igw" {
  vpc_id = aws_vpc.mincraft_vpc.id

  tags = {
    Name = "mincraft-igw"
  }
}

resource "aws_route_table" "mincraft_route_table" {
  vpc_id = aws_vpc.mincraft_vpc.id

  tags = {
    "Name" = "mincraft_route_table"
  }
}

resource "aws_route" "mincraft_route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.mincraft_route_table.id
  gateway_id             = aws_internet_gateway.mincraft_igw.id
}

resource "aws_route_table_association" "route_association_public_subnet" {
  subnet_id      = aws_subnet.mincraft_public_subnet.id
  route_table_id = aws_route_table.mincraft_route_table.id
}

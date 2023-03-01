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

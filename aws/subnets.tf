resource "aws_subnet" "protected" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidrs["protected"]

  tags = {
    Name = "protected-subnet"
  }
}

resource "aws_subnet" "firewall" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidrs["firewall"]

  tags = {
    Name = "firewall-subnet"
  }
}

resource "aws_subnet" "bastion" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidrs["bastion"]
  map_public_ip_on_launch = true

  tags = {
    Name = "bastion-subnet"
  }
}

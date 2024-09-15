# Main route table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "main-route-table"
  }
}

# Protected subnet route table
resource "aws_route_table" "protected" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_instance.firewall.primary_network_interface_id
  }

  tags = {
    Name = "protected-route-table"
  }
}

# Route table associations
resource "aws_route_table_association" "firewall" {
  subnet_id      = aws_subnet.firewall.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "bastion" {
  subnet_id      = aws_subnet.bastion.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "protected" {
  subnet_id      = aws_subnet.protected.id
  route_table_id = aws_route_table.protected.id
}

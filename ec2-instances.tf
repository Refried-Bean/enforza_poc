data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_key_pair" "key_pair_name" {
  key_name = var.key_pair_name
}

# Protected Instance
resource "aws_instance" "protected" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.protected.id
  key_name      = data.aws_key_pair.key_pair_name.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get upgrade -y
              EOF

  tags = {
    Name = "protected-instance"
  }
}

# Firewall Instance
resource "aws_instance" "firewall" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.firewall.id
  key_name      = data.aws_key_pair.key_pair_name.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  associate_public_ip_address = true

  source_dest_check = false

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get upgrade -y
              curl -L https://efz.io/install | sudo bash -s -- --companyId=${var.enforza_company_id} > /var/log/enforza_bootstrap.log
              EOF

  tags = {
    Name = "firewall-instance"
  }
}

# Additional network interface for firewall instance
resource "aws_network_interface" "firewall" {
  subnet_id       = aws_subnet.firewall.id
  security_groups = [aws_security_group.allow_ssh.id]

  attachment {
    instance     = aws_instance.firewall.id
    device_index = 1
  }
}

# Bastion Instance
resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.bastion.id
  key_name      = data.aws_key_pair.key_pair_name.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get upgrade -y
              EOF

  tags = {
    Name = "bastion-instance"
  }
}

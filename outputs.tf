output "vpc_id" {
  value = aws_vpc.main.id
}

output "protected_instance_private_ip" {
  value = aws_instance.protected.private_ip
}

output "firewall_instance_private_ip" {
  value = aws_instance.firewall.private_ip
}

output "firewall_instance_public_ip" {
  value = aws_instance.firewall.public_ip
}


output "bastion_instance_private_ip" {
  value = aws_instance.bastion.private_ip
}

output "bastion_instance_public_ip" {
  value = aws_instance.bastion.public_ip
}

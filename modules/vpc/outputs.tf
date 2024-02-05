
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main_vpc.id
}

output "subnet_a_id" {
  description = "The ID of the Subnet A"
  value       = aws_subnet.public_subnet_a.id
}

output "subnet_b_id" {
  description = "The ID of Subnet B"
  value       = var.single_target ? null : aws_subnet.public_subnet_b[0].id
}
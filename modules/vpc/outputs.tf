
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main_vpc.id
}

output "public_subnet_1a_id" {
  description = "The ID of the Subnet A"
  value       = aws_subnet.public_subnet_1a.id
}

output "public_subnet_1b_id" {
  description = "The ID of Subnet B"
  value       = aws_subnet.public_subnet_1b.id
}
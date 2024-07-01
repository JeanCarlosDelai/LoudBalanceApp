output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "route_table_id" {
  description = "Route Table ID"
  value       = aws_route_table.rt.id
}

output "security_group_id" {
  description = "Security Group ID"
  value = aws_security_group.allow_ssh_http.id
}

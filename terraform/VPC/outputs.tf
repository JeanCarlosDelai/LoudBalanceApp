output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.main.id
}

output "route_table_id" {
  description = "ID da Route Table"
  value       = aws_route_table.rt.id
}

output "security_group_id" {
  value = aws_security_group.allow_ssh_http.id
}

output "instance_1_public_ip" {
  value = aws_instance.LoudBalanceApp1.public_ip
}

output "instance_2_public_ip" {
  value = aws_instance.LoudBalanceApp2.public_ip
}

output "instance_id_1" {
  value = aws_instance.LoudBalanceApp1.id
}

output "instance_id_2" {
  value = aws_instance.LoudBalanceApp2.id
}

output "subnet_id_1" {
  value = aws_subnet.private_subnet[0].id
}

output "subnet_id_2" {
  value = aws_subnet.private_subnet[1].id
}

output "private_rt" {
  value = aws_route_table.private.id
}
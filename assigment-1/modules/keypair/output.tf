###################OUTPUT#########################################

output "keypair_name" {
  value = aws_key_pair.create_keypair.key_name
}

output "keypair_arn" {
  value = aws_key_pair.create_keypair.arn
}

output "create_keypair_fingerprint" {
  value = aws_key_pair.create_keypair.fingerprint
}

output "private_key_pem" {
  value = tls_private_key.tls_key.private_key_pem
}
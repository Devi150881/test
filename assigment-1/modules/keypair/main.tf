
resource "tls_private_key" "tls_key" {
  algorithm = var.algorithim
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "create_keypair" {
  key_name = var.keypair_name
  public_key = tls_private_key.tls_key.public_key_openssh
}
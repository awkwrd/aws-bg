resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "cmtr-fvj3554p-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

output "private_key" {
  description = "The private key for SSH access to the instances."
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}

output "key_name" {
  description = "The name of the SSH key pair."
  value       = aws_key_pair.ssh_key.key_name
}
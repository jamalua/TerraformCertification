output "public_ip" {
  value = values(aws_instance.jamal_server)[*].public_ip
}
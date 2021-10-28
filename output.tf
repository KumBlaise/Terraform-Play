output "instance_ip_addr" {
  value       = aws_instance.pub-sub1[*].public_ip
  description = "The private IP address of the public instance."
}

output "instance_dns" {
  value = aws_instance.pub-sub1[*].public_dns
}
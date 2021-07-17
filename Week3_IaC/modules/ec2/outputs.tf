output "public_ip" {
  value = aws_instance.web.public_ip  //part of the attributes references that be exported
}
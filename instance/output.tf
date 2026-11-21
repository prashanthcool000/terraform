output "instance_output" {
    value = [aws_instance.instance-1.id, aws_instance.instance-1.public_ip, aws_instance.instance-1.private_ip]
  
}
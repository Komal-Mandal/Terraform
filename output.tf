
output "ec2_public_ip" {

    value = aws_instance.example.puplic_ip
}


output "ec2_public_dns" {

    value = aws_instance.example.puplic_dns
}

output "ec2_private_ip" {

    value = aws_instance.example.private_ip
}

output "ec2_private_dns" {

    value = aws_instance.example.private_dns
}





### for count output.tf

# # output "ec2_public_ip" {
# #
#     value = aws_instance.example[*].puplic_ip # f[*] for multiple instances
# }


# output "ec2_public_dns" {

#     value = aws_instance.example[*].puplic_dns
# }

# output "ec2_private_ip" {

#     value = aws_instance.example[*].private_ip
# }

# output "ec2_private_dns" {

#     value = aws_instance.example[*].private_dns
# }


#### for for_each output.tf

output "ec2_public_ip" {
  value = [
    for key in aws_instance.example : key.public_ip

  ]
}

output "ec2_private_ip" {
  value = [
    for key in aws_instance.example : key.private_ip

  ]
}
output "ec2_public_dns" {
  value = [
    for key in aws_instance.example : key.public_dns

  ]
}
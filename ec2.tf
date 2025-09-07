
# key-pair
resource "aws_key_pair" "deployer" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}


# vpc & security group

resource "aws_default_vpc" "default" {



}

resource "aws_security_group" "mysecurity" {
  name        ="automate-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "automate-sg"
  }

    ingress {
        description = "TLS from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
        description = "http port"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
        description = "node app"
        from_port   = 8000
        to_port     = 80000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

  }


egress {
        description = "TLS from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]

  }




}

# ec2 instance

resource "aws_instance" "example" {
  # count = 2

  for_each = tomap({
    instance1 = "t3.micro",
    instance2 = "t3.micro"
  })
  user_data = file("nginx.sh")
  key_name = "aws_key_pair.deployer.key_name"
  security_groups = [aws_security_group.mysecurity.name]
  ami           = var.aws_ami
  instance_type = each.value

  tags = {
    Name = each.key
  }

  root_block_device {
    volume_size = var.env == "prd" ? 20 : var.aws_root_block_device_size
    volume_type = "gp3"
  }
}

resource "aws_instance" "new_instance" {
  ami = "unknown"
  instance_type = "unknown" # import id of server in this instance

}

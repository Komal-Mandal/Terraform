
variable "ec2_instance_type" {
  description = "Type of instance to use"
  type        = string
  default     = "t2.micro"
}

variable "aws_ami" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "aws_root_block_device_size" {
  description = "Size of the root block device in GB"
  type        = number
  default     = 8
}


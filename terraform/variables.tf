variable "region" {
  default = "us-east-1"
}
variable "ami" {
  # https://cloud-images.ubuntu.com/locator/ec2/
  description = "aws AMI number (default: Ubuntu 16.04LTS)"
  default = "ami-927185ef"
}
variable "instance_type" {
  description = "Ec2 instance type. can use general or burstable t2 version for"
  default = "t2.large"
}
variable "default_tags" {
  type = "map"
  default = {
    Name = "Jupyter Notebook Meganode"
    Purpose = ""
    KillDate = ""
    Owner = ""
  }
}

variable "keypair_name" {
  description = "MyKeyPair"
  default = "MyKeyPair"
}
variable "private_key_path" {
  default = "~/.aws/key.pem"
}
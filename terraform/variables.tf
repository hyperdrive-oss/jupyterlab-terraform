variable "keyname" {}
variable "region" {
  default = "us-east-1"
}
variable "ami" {
  description = "aws AMI number (default: Ubuntu 16.04LTS)"
  default = "ami-927185ef"
}
variable "keypair_name" {
  description = "MyKeyPair"
  default = "~/.aws/key.pem""
}
variable "private_key_path" {
  default = "~/.aws/key.pem""
}
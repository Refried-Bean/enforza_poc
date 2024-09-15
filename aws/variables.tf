variable "aws_region" {
  default = "eu-west-2"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "enforza_company_id" {}
variable "key_pair_name" {}


variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  type = map(string)
  default = {
    protected = "10.0.1.0/24"
    firewall  = "10.0.2.0/24"
    bastion   = "10.0.3.0/24"
  }
}

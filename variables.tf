variable "cloud_env" {
  type    = string
  description = "Enter the Environment (dev/qa/prod)."
  default     = "dev"
}

variable "vpc_cidr" {
  type     = string
  description = "Enter the VPC CIDR Value"
  default     = "10.0.0.0/16"
}

variable "vpc_tag_name" {
  type   = string
  description = "Enter the Vpc Tag Name"
  default = "new-vpc"
}

variable "public_cidrs" {
  type   = list(string)
  description  = "Enter the Public Subnet CIDR"
  default   = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidrs" {
  type    = list(string)
  description  = "Enter the Private Subnet CIDR"
  default      = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "access_ip" {
  type   = string
  default = "0.0.0.0/0"
}

variable "instance_count" {
  type = number
  default = 1
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "instance_key_name" {
  type  = string
  default = "jenkins"
}

variable "vol_size" {
  type  = string
  default = "8"
}

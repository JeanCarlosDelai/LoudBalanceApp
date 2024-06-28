variable "location" {
  description = "Região onde os recursos serão criados na AWS"
  type        = string
  default     = "sa-east-1"
}

variable "cidr_block_vpc" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr_block_subnet_1" {
  description = "CIDR block for the first subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "cidr_block_subnet_2" {
  description = "CIDR block for the second subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "availability_zone_a" {
  description = "Availability Zone for the first subnet"
  type        = string
  default     = "sa-east-1a"
}

variable "availability_zone_c" {
  description = "Availability Zone for the second subnet"
  type        = string
  default     = "sa-east-1c"
}

variable "cidr_block_route_table" {
  description = "CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}

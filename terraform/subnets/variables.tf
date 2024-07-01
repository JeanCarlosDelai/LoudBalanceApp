variable "availability_zone_a" {
  description = "Zona de disponibilidade onde a subnet A será criada"
  type        = string
}

variable "availability_zone_c" {
  description = "Zona de disponibilidade onde a subnet B será criada"
  type        = string
}

variable "cidr_block_subnet_1" {
  description = ""
  type        = string
}

variable "cidr_block_subnet_2" {
  description = ""
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "route_table_id" {
  description = "Route Table ID"
  type        = string
}



variable "security_group_id" {
  description = "Secury Group ID"
  type        = string
}

variable "subnets" {
  description = "List of Subnet IDs"
  type        = list(string)
}

variable "loud_balance_name" {
  description = "Loud Balance Name"
  type        = string
  default = "loud-balance-1"
}

variable "target_group_name" {
  description = "Target Group Name"
  type        = string
  default = "target-group-1"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "LoudBalanceApp1_id" {
  description = "ID"
  type        = string
}

variable "LoudBalanceApp2_id" {
  description = "ID"
  type        = string
}

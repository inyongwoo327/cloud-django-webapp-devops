variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "key_name" {
  description = "Name of the SSH key"
  default     = "my-key"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
variable "mongo_username" {
  description = "MongoDB Username"
  type        = string
  default     = "root"
}

variable "mongo_password" {
  description = "MongoDB Password"
  type        = string
  sensitive   = true
  default     = "example"
}

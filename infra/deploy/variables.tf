variable "prefix" {
  description = "Prefix for resources in aws"
  default     = "raa"
}

variable "contact" {
  description = "cantact email for tagging resources"
  default     = "sadhucharan994@gmail.com"
}

variable "project" {
  description = "project name for tagging resources"
  default     = "reciepe-app-api"
}

variable "db_username" {
  description = "Username for the recipe app api database"
  default     = "recipeapp"
}

variable "db_password" {
  description = "Password for the Terraform database"
}

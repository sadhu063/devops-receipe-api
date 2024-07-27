variable "project" {
  description = "project name for tagging resources"
  default     = "recipe-app-api"
}


variable "contact" {
  description = "contact name for tagging resources"
  default     = "sadhucharan994@gmail.com"
}

variable "tf_state_bucket" {
  description = "AWS s3 bucket for state file storing"
  default     = "devops-recipe-api-tfstate-backend"
}

variable "tf_state_lock-table" {
  description = "NAme of the dynamoDB table for TF state Locking"
  default     = "devops-reciepe-api-tfstate-backend-lock"
}
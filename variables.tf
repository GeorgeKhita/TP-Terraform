variable "subscription_id" {
  description = "Votre subscription ID Azure"
  type        = string
  default     = "cb514673-1b19-46b0-b454-5b670918d9e4"
}

variable "location" {
  description = "Région Azure"
  type        = string
  default     = "France Central"
}

variable "prefix" {
  description = "Préfixe pour nommer les ressources"
  type        = string
  default     = "tp-azure"
}
# resource group variable  declaration


variable "location" {
  description = "location of Resource gRoup"
  type        = string
}

variable "tags" {
  description = "******************************"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name of Resource gRoup"
  type        = string

}


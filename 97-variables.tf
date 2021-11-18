variable "key_pair_value" {
  type    = string
  default = "default_key_name"
}

variable "key_pair_name" {
  type    = string
  default = "default_key_value"
}

variable "region" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "profile" {
  type    = string
  default = "noprod"
}

variable "env" {
  type = string
}
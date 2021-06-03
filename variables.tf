# variable "elb_name" {
#   type = string
# }

# variable "az" {
#   type = list
# }

# variable "timeout" {
#   type = number
# }

variable "ami_type" {
    type = string
    default = "ami-010aff33ed5991201"
}
variable "imap" {
  type = map(string)
  default = {
    "default" = "t2.micro"
    "prod" = "t2.medium"
    "test" = "t2.nano"
  }
}
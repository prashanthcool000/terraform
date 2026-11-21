variable "iname" {
description = "name of instance"
type = string
}
variable "ami" {
description = "type of OS"
type = string
}
variable "instance_type" {
description = "instance type"
type = string
}
variable "key" {
description = "key"
type = string
}
variable "availability_zone" {
description = "availability zone"
type = string
}
variable "volume" {
description = "storage of server"
type = number
}
variable "security_groups" {
    type = list(string)
}
variable "iam_profile" {
    type = string
}

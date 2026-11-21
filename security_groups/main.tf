resource "aws_security_group" "newsg" {
    name = var.sg_name
    description = "alternative way"

    dynamic "ingress" {
        for_each = var.ports
        content {
          from_port = ingress.value
          to_port = ingress.value
          protocol = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }  

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

variable "ports" {
  type = list(any)
  default = [ 0 ]
}
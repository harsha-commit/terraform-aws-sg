### Project Variables ###
variable "project_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

### VPC Variables ###
variable "vpc_id" {
  type = string
}

### SG Variables ###
variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "sg_tags" {
  type    = map(any)
  default = {}
}

variable "basic_ingress_rules" {
  type    = list(any)
  default = []
}

variable "basic_egress_rules" {
  type = list(any)
  default = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

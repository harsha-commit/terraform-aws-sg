resource "aws_security_group" "this" {
  name        = "${var.project_name}-${var.environment}-${var.sg_name}-sg"
  description = var.sg_description

  dynamic "ingress" {
    for_each = var.basic_ingress_rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  dynamic "egress" {
    for_each = var.basic_egress_rules
    content {
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
    }
  }

  tags = merge(local.common_tags, var.sg_tags, {
    Name = "${var.project_name}-${var.environment}-${var.sg_name}-sg"
  })

  vpc_id = var.vpc_id
}


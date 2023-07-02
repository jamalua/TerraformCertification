provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}

# variable "settings" {
#   type = list(map(string))
#   default = [{
#     "from" = "80"
#     "to"   = "81"
#     },
#     {
#       "from" = "8080"
#       "to"   = "8081"
#     },
#     {
#       "from" = "443"
#       "to"   = "444"
#     }
#   ]
# }


# resource "aws_security_group" "dynamic_sg" {
#   name        = "dynamic_sg"
#   description = "Dynamic ingress block"

#   dynamic "ingress" {
#     for_each = var.settings
#     iterator = ports
#     content {
#       from_port   = ports.value["from"]
#       to_port     = ports.value["to"]
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }

#   }

# }

variable "settings" {
    type = object({
      from = list(string)
      to = list(string) 
    })
    default = {
      from = [ "80", "8080", "443" ]
      to = [ "81", "8081", "444" ]
    }
}

resource "aws_security_group" "dynamic_sg" {
  name        = "dynamic_sg"
  description = "Dynamic ingress block"

  dynamic "ingress" {
    for_each = var.settings[*]
    content {
      from_port   = ingress.value.from
      to_port     = ingress.value.to
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
}
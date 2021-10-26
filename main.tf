terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

#### The following variable is not used anywhere
variable "some_variable" {
  description = "A variable that is declared but never used"
  type = string
  default = null
  
}

#### The following is a null resource - it will not deploy anything
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}

#### This resource is a purposefully insecure SG rule 
#### which will not deploy because the security group does not exist

# resource "aws_security_group_rule" "my-insecure-rule" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = "sg-123456"
# }
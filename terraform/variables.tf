# Define variables if needed (e.g., instance type, AMI ID)
variable "regions" {
  description = "The AWS region to deploy in"
  default     = "eu-west-3"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  default     = "t2.micro"
  type        = string
}

variable "ami" {
  description = "The AMI ID to use for the instances"
  default     = "ami-0fda19674ff597992"
  type        = string
}
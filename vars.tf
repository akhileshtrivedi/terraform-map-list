variable "aws_ami" {
  default = "ami-0002bdad91f793433"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "region" {
  default = "ap-south-1"
}
variable "AMI" {
  type = map(string)

  default = {
    ap-south-1 = "ami-0002bdad91f793433"
    us-west-2  = "ami-aa5ebdd2"
    us-east-1  = "ami-4fffc834"
  }
}
variable "instance_count" {
  default = 1
}
variable "availability_zones" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}
variable "instance_tags" {
  type    = list(string)
  default = ["Terraform-1", "Terrform-2", "Terraform-3"]

}

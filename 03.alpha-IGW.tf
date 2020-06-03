resource "aws_internet_gateway" "alpha-igw" {
#1번 VPC
vpc_id = "${aws_vpc.vpc-alpha.id}"
tags = {
Name = "alpha",
Kinds = "igw"
}
}
resource "aws_internet_gateway" "beta-igw" {
#2번 VPC
vpc_id = "${aws_vpc.vpc-beta.id}"
tags = {
Name = "beta",
Kinds = "igw"
}
}
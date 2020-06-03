resource "aws_subnet" "beta-subnet-2a" {
#2번 VPC
vpc_id = "${aws_vpc.vpc-beta.id}"
#2-1번 subnet
availability_zone = "ap-northeast-2a"
cidr_block = "20.0.1.0/24"
tags = {
Name = "beta",
Kinds = "subnet-2a"
}
}
resource "aws_subnet" "beta-subnet-2c" {
#2번 VPC
vpc_id = "${aws_vpc.vpc-beta.id}"
#2-2번 subnet
availability_zone = "ap-northeast-2c"
cidr_block = "20.0.2.0/24"
tags = {
Name = "beta",
Kinds = "subnet-2c"
}
}
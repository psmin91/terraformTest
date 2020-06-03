resource "aws_subnet" "alpha-subnet-2a" {
#1번 VPC
vpc_id = "${aws_vpc.vpc-alpha.id}"
#1-1번 서브넷
availability_zone = "ap-northeast-2a"
cidr_block = "10.0.1.0/24"
tags = {
Name = "alpha",
Kinds = "subnet-2a"
}
}
resource "aws_subnet" "alpha-subnet-2c" {
#1번 VPC
vpc_id = "${aws_vpc.vpc-alpha.id}"
#1-1번 서브넷
availability_zone = "ap-northeast-2c"
cidr_block = "10.0.2.0/24"
tags = {
Name = "alpha",
Kinds = "subnet-2c"
}
}
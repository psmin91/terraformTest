#Default SecureGroup != ec2 SecureGroup
resource "aws_default_security_group" "alpha-SG-default" {
#1번 VPC
vpc_id = "${aws_vpc.vpc-alpha.id}"
ingress {
protocol = -1
self = true
from_port = 0
to_port = 0
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
tags = {
Name = "alpha",
Kinds = "SG-default"
}
}
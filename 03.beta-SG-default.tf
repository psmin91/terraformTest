#Default SecureGroup != ec2 SecureGroup
resource "aws_default_security_group" "beta-SG-default" {
#1번 VPC
vpc_id = "${aws_vpc.vpc-beta.id}"
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
Name = "beta",
Kinds = "SG-default"
}
}
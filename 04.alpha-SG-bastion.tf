resource "aws_security_group" "alpha-SG-bastion" {
name = "alpha-SG-bastion"
description = "open ssh port for bastion"
vpc_id = "${aws_vpc.vpc-alpha.id}"
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
tags = {
Name = "alpha",
Kinds = "SG-bastion"
}
}
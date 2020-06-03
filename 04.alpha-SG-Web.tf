resource "aws_security_group" "alpha-SG-Web" {
name = "alpha-SG-Web"
description = "open http port for Webservice"
vpc_id = "${aws_vpc.vpc-alpha.id}"
ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
#bation에서만 들어올수있게 22번 포트 필요함.

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
tags = {
Name = "alpha",
Kinds = "SG-Web"
}
}
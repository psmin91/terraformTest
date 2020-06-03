resource "aws_instance" "beta-web1" {
ami = "${var.amazon_linux}"
availability_zone = "${var.amazon-region}"
instance_type = "t2.nano"
key_name = "${var.dev_keyname}"
vpc_security_group_ids = [
"${aws_security_group.beta-SG-Web.id}",
"${aws_default_security_group.beta-SG-Default.id}",
]
subnet_id = "${aws_subnet.beta-subnet-2a.id}"
associate_public_ip_address = true
tags = {
Name = "beta-WEB1",
Kinds = "EC2"
}
}



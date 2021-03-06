resource "aws_instance" "alpha-bastion" {
ami = "${var.amazon_linux}"
availability_zone = "${var.amazon-region}"
instance_type = "t2.nano"
key_name = "${var.dev_keyname}"
vpc_security_group_ids = [
"${aws_security_group.alpha-SG-bastion.id}",
"${aws_default_security_group.alpha-SG-Default.id}",
]
subnet_id = "${aws_subnet.alpha-subnet-2a.id}"
associate_public_ip_address = true
tags = {
Name = "alpha-bastion-2a",
Kinds = "EC2"
}
}



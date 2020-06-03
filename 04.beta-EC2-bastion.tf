resource "aws_instance" "beta-bastion" {
ami = "${var.amazon_linux}"
availability_zone = "${var.amazon-region}"
instance_type = "t2.nano"
key_name = "${var.dev_keyname}"
vpc_security_group_ids = [
"${aws_security_group.beta-SG-bastion.id}",
"${aws_default_security_group.beta-SG-Default.id}",
]
subnet_id = "${aws_subnet.beta-subnet-2a.id}"
associate_public_ip_address = true
tags = {
Name = "beta-bastion-2a",
Kinds = "EC2"
}
}



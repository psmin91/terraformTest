resource "aws_alb" "beta-alb" {
name = "beta-alb"
internal = false
security_groups = ["${aws_security_group.beta-SG-alb.id}"]
subnets = [
"${aws_subnet.beta-subnet-2a.id}",
"${aws_subnet.beta-subnet-2c.id}"
]
access_logs {
bucket = "${aws_s3_bucket.beta-S3-albLog.id}"
prefix = "frontend-alb"
enabled = true
}
tags = {
Name = "beta",
Kinds = "ALB"
}
}
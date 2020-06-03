resource "aws_alb" "alpha-alb" {
name = "alpha-alb"
internal = false
security_groups = ["${aws_security_group.alpha-SG-alb.id}"]
subnets = [
"${aws_subnet.alpha-subnet-2a.id}",
"${aws_subnet.alpha-subnet-2c.id}"
]
access_logs {
bucket = "${aws_s3_bucket.alpha-S3-albLog.id}"
prefix = "frontend-alb"
enabled = true
}
tags = {
Name = "alpha",
Kinds = "ALB"
}
}
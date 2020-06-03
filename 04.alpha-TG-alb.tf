resource "aws_alb_target_group" "alpha-frontend" {
name = "frontend-target-group"
port = 80
protocol = "HTTP"
vpc_id = "${aws_vpc.vpc-alpha.id}"
health_check {
interval = 30
path = "/ping"
healthy_threshold = 3
unhealthy_threshold = 3
}
tags = { Name = "Frontend Target Group" }
}
resource "aws_alb_target_group_attachment" "alpha-frontend_2a" {
target_group_arn = "${aws_alb_target_group.alpha-frontend.arn}"
target_id = "${aws_instance.alpha-web1.id}"
port = 80
}
resource "aws_alb_target_group_attachment" "alpha-frontend_2c" {
target_group_arn = "${aws_alb_target_group.alpha-frontend.arn}"
target_id = "${aws_instance.alpha-web2.id}"
port = 80
}

resource "aws_alb_listener" "alpha-http" {
load_balancer_arn = "${aws_alb.alpha-alb.arn}"
port = "80"
protocol = "HTTP"
default_action {
target_group_arn = "${aws_alb_target_group.alpha-frontend.arn}"
type = "forward"
}
}
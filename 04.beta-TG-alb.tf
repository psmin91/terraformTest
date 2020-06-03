resource "aws_alb_target_group" "beta-frontend" {
name = "frontend-target-group"
port = 80
protocol = "HTTP"
vpc_id = "${aws_vpc.vpc-beta.id}"
health_check {
interval = 30
path = "/ping"
healthy_threshold = 3
unhealthy_threshold = 3
}
tags = { Name = "Frontend Target Group" }
}

resource "aws_alb_target_group_attachment" "beta-frontend_2a" {
target_group_arn = "${aws_alb_target_group.beta-frontend.arn}"
target_id = "${aws_instance.beta-web1.id}"
port = 80
}
resource "aws_alb_target_group_attachment" "beta-frontend_2c" {
target_group_arn = "${aws_alb_target_group.beta-frontend.arn}"
target_id = "${aws_instance.beta-web2.id}"
port = 80
}

resource "aws_alb_listener" "beta-http" {
load_balancer_arn = "${aws_alb.beta-alb.arn}"
port = "80"
protocol = "HTTP"
default_action {
target_group_arn = "${aws_alb_target_group.beta-frontend.arn}"
type = "forward"
}
}
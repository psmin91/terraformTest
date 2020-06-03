# 1번 routetable
resource "aws_route_table" "alpha-Route" {
vpc_id = "${aws_vpc.vpc-alpha.id}"
route {
cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.alpha-igw.id}"
}
tags = {
Name = "alpha",
Kinds = "Route"
}
}
#1번 routetable =(연결)= 1-1번 서브넷
resource "aws_route_table_association" "alpha-RouteAsso_2a" {
subnet_id = "${aws_subnet.alpha-subnet-2a.id}"
route_table_id = "${aws_route_table.alpha-Route.id}"
}
#1번 routetable =(연결)= 1-2번 서브넷
resource "aws_route_table_association" "alpha-RouteAsso_2c" {
subnet_id = "${aws_subnet.alpha-subnet-2c.id}"
route_table_id = "${aws_route_table.alpha-Route.id}"
}
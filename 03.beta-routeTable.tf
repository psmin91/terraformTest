# 1번 routetable
resource "aws_route_table" "beta-Route" {
vpc_id = "${aws_vpc.vpc-beta.id}"
route {
cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.beta-igw.id}"
}
tags = {
Name = "beta",
Kinds = "Route"
}
}
#1번 routetable =(연결)= 1-1번 서브넷
resource "aws_route_table_association" "beta-RouteAsso_2a" {
subnet_id = "${aws_subnet.beta-subnet-2a.id}"
route_table_id = "${aws_route_table.beta-Route.id}"
}
#1번 routetable =(연결)= 1-2번 서브넷
resource "aws_route_table_association" "beta-RouteAsso_2c" {
subnet_id = "${aws_subnet.beta-subnet-2c.id}"
route_table_id = "${aws_route_table.beta-Route.id}"
}
data "aws_caller_identity" "current" { }

resource "aws_vpc_peering_connection" "alpha-peer-beta" {
  # Main VPC ID.
  vpc_id = "${aws_vpc.vpc-alpha.id}"

  # AWS Account ID. This can be dynamically queried using the
  # aws_caller_identity data resource.
  # https://www.terraform.io/docs/providers/aws/d/caller_identity.html
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"

  # Secondary VPC ID.
  peer_vpc_id = "${aws_vpc.vpc-beta.id}"

  # Flags that the peering connection should be automatically confirmed. This
  # only works if both VPCs are owned by the same account.
  auto_accept = true
}

resource "aws_route" "peering-alpha" {
  # ID of VPC 2 main route table.
  route_table_id = "${aws_route_table.beta-Route.id}"

  # CIDR block / IP range for VPC 2.
  destination_cidr_block = "${aws_vpc.vpc-alpha.cidr_block}"

  # ID of VPC peering connection.
  vpc_peering_connection_id = "${aws_vpc_peering_connection.alpha-peer-beta.id}"
}

resource "aws_route" "peering-beta" {
  # ID of VPC 1 main route table.
  route_table_id = "${aws_route_table.alpha-Route.id}"

  # CIDR block / IP range for VPC 2.
  destination_cidr_block = "${aws_vpc.vpc-beta.cidr_block}"

  # ID of VPC peering connection.
  vpc_peering_connection_id = "${aws_vpc_peering_connection.alpha-peer-beta.id}"
}

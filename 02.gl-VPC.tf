#1번 VPC
resource "aws_vpc" "vpc-alpha" {
#ip 변경
cidr_block = "10.0.0.0/16"
enable_dns_hostnames = true
enable_dns_support = true
instance_tenancy = "default"
tags = {
Name = "alpha",
Kinds = "VPC"
}
}
#2번 VPC
resource "aws_vpc" "vpc-beta" {
#ip 변경
cidr_block = "20.0.0.0/16"
enable_dns_hostnames = true
enable_dns_support = true
instance_tenancy = "default"
tags = {
Name = "beta",
Kinds = "VPC"
}
}
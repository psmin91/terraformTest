#ami 기본(200511) ami-01288945bd24ed49a
variable "amazon_linux" {
# Amazon Linux 2 AMI (HVM), SSD Volume Type - 200511
default = "ami-01288945bd24ed49a"
}
#key 값
variable "user_keyname" {
##매일 지우기
default = ""
}
# 서울리전 Classic Load Balancer *리전 진입구"
# https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html
variable "alb_account_id" {
default = "600734575887"

}
variable "amazon-region" {
default = "ap-northeast-2"    
    
}

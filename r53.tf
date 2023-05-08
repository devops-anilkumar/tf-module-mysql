# THIS CREATES THE C NAME RECORD FOR MYSQL
resource "aws_route53_record" "mysql" {
  zone_id = data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTED_ZONE_ID
  name    = "mysql-${var.ENV}"
  type    = "CNAME"
  ttl     = 10
  records = [aws_db_cluster.mysql.address]
}

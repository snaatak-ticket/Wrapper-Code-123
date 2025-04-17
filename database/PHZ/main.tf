resource "aws_route53_record" "private_record" {
  count   = length(var.private_ips)
  zone_id = var.route53_zone_id
  name    = "${var.name_prefix[count.index]}.${var.private_domain_name}"
  type    = "A"
  ttl     = 300
  records = [var.private_ips[count.index]]
}

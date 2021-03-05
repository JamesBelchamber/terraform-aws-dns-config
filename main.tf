resource "aws_route53_record" "cname" {
  for_each = var.cname_records

  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"
  type    = "CNAME"

  records = [each.value]
  ttl     = 60
}

resource "aws_route53_record" "mx" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "MX"

  records = var.mx_records
  ttl     = 60
}

resource "aws_route53_record" "txt" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "TXT"

  records = var.txt_records
  ttl     = 60
}

resource "aws_route53_record" "dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc.${var.domain_name}"
  type    = "TXT"

  records = [var.dmarc_record]
  ttl     = 60
}

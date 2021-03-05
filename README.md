AWS DNS Config
==============

Easily create standard DNS records for a domain.

```
module "www_redirect" {
  source        = "JamesBelchamber/dns-config/aws"
  domain_name   = "yourzone.com"
  zone_id       = aws_route53_zone.yourzone_com.id
  cname_records = {
    "your_cname_subdomain" = "where.the.cname.points."
    "your_cname_subdomain" = "where.the.cname.points."
  }
  mx_records    = [
    "10 mx1.youremail.com.",
    "20 mx2.youremail.com."
  ]
  txt_records   = ["v=spf1 include:spf.youremail.com ~all"]
  dmarc_record  = "v=DMARC1; p=none;"
}
```
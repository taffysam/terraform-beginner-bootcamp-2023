locals  {
  s3_origin_id = "MyS3Orgin"
}


resource "aws_cloudfront_origin_access_control" "default" {
  name                              = "OAC"
  description                       = "OAC Policy ${var.bucket_name}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}



resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name           = aws_s3_bucket.website_bucket.bucket_regional_domain_name
    origin_id             = local.s3_origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.default.id
   
  }


  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Static Website Hosting for ${var.bucket_name}"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"  # Specify the viewer protocol policy here
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  tags = {
    UserUuid    = var.user_uuid
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}


resource "terraform_data" "invalidate_cache" {
  triggers_replace = terraform_data.content_version.output

  provisioner "local-exec" {
    command = "aws cloudfront create-invalidation --distribution-id ${aws_cloudfront_distribution.s3_distribution.id} --paths '/*'"
    
  }
}
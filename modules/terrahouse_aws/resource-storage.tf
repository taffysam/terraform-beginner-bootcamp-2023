
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}


resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.module}/public/index.html"
  content_type = "text/html"

  etag = filemd5("${path.module}/public/index.html")
  lifecycle {
    replace_triggered_by = [ terraform_data.content_version.output]
  ignore_changes = [ etag ]
}

}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = "${path.module}/public/error.html"
  content_type = "text/html"
  
  
  etag = filemd5("${path.module}/public/error.html")
lifecycle {
  replace_triggered_by = [ terraform_data.content_version.output]
  ignore_changes = [ etag ]
}

}


resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid"       : "AllowCloudFrontServicePrincipalReadOnly",
          "Effect"    : "Allow",
          "Principal" : {
            "Service" : "cloudfront.amazonaws.com"
          },
          "Action"    : "s3:GetObject",
          "Resource"  : "arn:aws:s3:::${aws_s3_bucket.website_bucket.id}/*",
          "Condition" : {
            "StringEquals" : {
              "AWS:SourceArn" : "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
            }
          }
        }
      ]
    }
  )
}


resource "terraform_data" "content_version" {
  input = var.content_version
  
}
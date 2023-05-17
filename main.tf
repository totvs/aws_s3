resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_website_configuration" "bucket_website_config" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = var.index_document["suffix"]
  }

  error_document {
    key = var.error_document["key"]
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_ss_encryption_config" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    bucket_key_enabled = var.rule["bucket_key_enabled"]
    apply_server_side_encryption_by_default {
      sse_algorithm = var.rule.apply_server_side_encryption_by_default["sse_algorithm"]
    }
  }
}
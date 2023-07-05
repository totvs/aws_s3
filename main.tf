resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
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

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.bucket
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "bucket_policy"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = [
                "s3:GetObject"
            ]
        Resource = [
          "${aws_s3_bucket.bucket.arn}/*",
        ]
      },
    ]
  })
}

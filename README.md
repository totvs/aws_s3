# aws_s3

Terraform module that creates an AWS S3.

## Inputs

```hcl
module "aws_s3" {
  source = "aws_s3"
  
  bucket_name        = Name of the bucket. If omitted, Terraform will assign a random, unique name
  bucket_acl         = Canned ACL to apply to the bucket.
  bucket_index_doc   = Name of the index document for the website
  bucket_error_doc   = Name of the error document for the website
  bucket_key_enabled = Whether or not to use Amazon S3 Bucket Keys for SSE-KMS
  sse_algorithm      = Server-side encryption algorithm to use. Valid values are AES256 and aws:kms
}
```

Example
```hcl
module "aws_s3" {
  source = "aws_s3"
  
  bucket_name        = "bucket-example"
  bucket_acl         = "public-read"
  bucket_index_doc   = "index.html"
  bucket_error_doc   = "error.html"
  bucket_key_enabled = "sni-only"
  sse_algorithm      = "TLSv1.2_2021"
}
```

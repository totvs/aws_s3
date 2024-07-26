# aws_s3

Terraform module that creates an AWS S3.

## Inputs

```hcl
module "aws_s3" {
  source = "../modules/aws_s3"
  
  bucket = #Name of the bucket. If omitted, Terraform will assign a random, unique name
  acl    = #Canned ACL to apply to the bucket.

  index_document = {
    suffix = # Suffix that is appended to a request that is for a directory on the website endpoint.
  }

  error_document = {
    key = # Object key name to use when a 4XX class error occurs.
  }

  rule = {
    bucket_key_enabled = # Whether or not to use Amazon S3 Bucket Keys for SSE-KMS
    apply_server_side_encryption_by_default = {
      sse_algorithm = # Server-side encryption algorithm to use. Valid values are AES256 and aws:kms
    }
  }
}

```

Example
```hcl
module "aws_s3" {
  source = "../modules/aws_s3"
  
  bucket = "bucket-example"
  acl    = "public-read"

  index_document = {
    suffix = "index.html"
  }

  error_document = {
    key = "error.html"
  }

  rule = {
    bucket_key_enabled = "sni-only"
    apply_server_side_encryption_by_default = {
      sse_algorithm = "TLSv1.2_2021"
    }
  }
}
```


## Outputs
```hcl
output "bucket_id" {
  value = aws_s3_bucket.bucket.id # Name of the bucket
}

output "bucket_domain_name" {
  value = aws_s3_bucket.bucket.bucket_domain_name # Bucket domain name. Will be of format bucketname.s3.amazonaws.com
}

output "website_domain" {
  value = aws_s3_bucket.bucket.website_domain
}
```

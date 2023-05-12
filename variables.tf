variable "bucket_name" {
  description = "Name of bucket"
}

variable "bucket_acl" {
  description = "Bucket ACL"
}

variable "bucket_index_doc" {
  description = "Bucket index document name"
}

variable "bucket_error_doc" {
  description = "Bucket error document name"
}

variable "bucket_key_enabled" {
  description = "Whether or not to use Amazon S3 Bucket Keys for SSE-KMS"
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm to use."
}

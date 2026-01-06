resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket = "org-cloudtrail-logs-${random_id.suffix.hex}"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}

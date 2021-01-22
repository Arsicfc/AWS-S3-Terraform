# Specify Provider which cloud you are using.
provider "aws" {
  region     = "us-east-1"
}

# Create S3 Bucket
resource "aws_s3_bucket" "site" {
  bucket = "s3-site-arsicfc"
  acl    = "public-read"
  website {
    index_document = "Resume.html"
 }
}

# Create S3 Object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.site.bucket
  key    = "<fileName>.html"
  source = "<folderLocation/fileName.html>"
  acl    = "public-read"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("<folderLocation/fileName.html>")
}

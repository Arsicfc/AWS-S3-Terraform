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


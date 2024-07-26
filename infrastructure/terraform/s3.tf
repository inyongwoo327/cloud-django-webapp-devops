resource "aws_s3_bucket" "static_files" {
  bucket = "my-static-files-bucket"
  acl    = "public-read"

  tags = {
    Name = "static-files-bucket"
  }
}
resource "aws_s3_bucket" "test_bucket" {
  bucket = "vulnerable-test-bucket"
  acl    = "public-read-write" # Finding: Overly permissive ACL
}

resource "aws_security_group" "bad_sg" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Finding: Unrestricted SSH access
  }
}

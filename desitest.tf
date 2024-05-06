# mainx.tf

resource "aws_s3_bucket" "vulnerable_bucket" {
  bucket = "vulnerable-bucket-example"
  acl    = "public-read"  # This makes the S3 bucket publicly readable

  tags = {
    Name        = "vulnerable-bucket-example"
    Environment = "dev"
  }
}

resource "aws_security_group" "vulnerable_sg" {
  name        = "vulnerable-security-group"
  description = "Allow all inbound traffic"
  vpc_id      = "vpc-12345678"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # This allows inbound traffic from any IP
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vulnerable-sg"
  }
}

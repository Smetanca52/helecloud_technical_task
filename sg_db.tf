#allow inbound access to the database
resource "aws_security_group" "rds-sg" {
  name        = "rds-security-group"
  vpc_id      = "vpc-0c213f6e74ac46c96"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
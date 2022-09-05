#creating security group that allow ssh and hhtp

resource "aws_security_group" "SG1-ssh-http" {
  name = "SG1-ssh-http"
  description = "allowing ssh and http traffic"
  vpc_id = "vpc-0c213f6e74ac46c96"

#incoming traffic
  ingress{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress{
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
#EFS mount target
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#outgoing traffic
  egress{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
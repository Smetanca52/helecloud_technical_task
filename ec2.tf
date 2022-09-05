#creating 2 instances
resource "aws_instance" "workers" {
  ami               = "ami-0e2031728ef69a466"
  instance_type     = "t2.micro"
  key_name          = "web-key1"
  security_groups   = [ "${aws_security_group.SG1-ssh-http.name}" ]
  count             = 2
  tags              = {
    Name            = "heleserver${count.index + 1}"
   }
 }

resource "null_resource" "configure_web_nfs" {
depends_on  = [aws_efs_mount_target.mount]
count       = 2

connection {
type        = "ssh"
user        = "ec2-user"
private_key = file("web-key1.pem")
host        = aws_instance.workers[count.index].public_ip
 }

provisioner "remote-exec" {
script      = "script.sh"
 }
}


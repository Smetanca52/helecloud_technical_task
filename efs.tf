# Creating EFS file system
resource "aws_efs_file_system" "efs" {
creation_token  = "my-efs"
encrypted       = true
tags            = {
  Name          = "EFS1"
  }
}
# Creating Mount target of EFS
resource "aws_efs_mount_target" "mount" {
file_system_id  = aws_efs_file_system.efs.id
subnet_id       = "subnet-04e8aac2a6f919e1b"
security_groups = [aws_security_group.SG1-ssh-http.id]
}



#! /bin/bash
#installing and starting webser
sudo yum update -y
sudo yum install httpd php git -y -q
sudo systemctl start httpd
sudo systemctl enable httpd
# Mounting Efs 
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${aws_efs_file_system.efs.dns_name}:/  /var/www/html
#copying my old project from GitHub
sudo git clone https://github.com/Smetanca52/simple_calculator.git /var/www/html/
#installing SQL client
sudo yum install mysql -y
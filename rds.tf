resource "aws_db_instance" "default" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  db_name                = "DB1"
  username               = "root"
  password               = "123456789"
  vpc_security_group_ids = [ aws_security_group.rds-sg.id ]
  skip_final_snapshot    = true
  publicly_accessible    = false

}

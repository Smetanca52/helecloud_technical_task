resource "aws_elb" "ELB1" {
  name                    = "ELB1"
  availability_zones      = ["eu-central-1a", "eu-central-1b"]
    
listener {    
    instance_port         = 80
    instance_protocol     = "http"
    lb_port               = 80
    lb_protocol           = "http"
}  

health_check {  
    healthy_threshold     = 2
    unhealthy_threshold   = 2
    timeout               = 5
    target                = "HTTP:80/"
    interval              = 30
}

instances                 = ["${aws_instance.workers[0].id}", "${aws_instance.workers[1].id}"]
cross_zone_load_balancing = true
idle_timeout              = 40
tags                      = {
    name = "ELB1"
}
}

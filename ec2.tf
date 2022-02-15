resource "aws_instance" "web-1" {
  ami = "ami-0c6615d1e95c98aca"
  #ami = "${data.aws_ami.my_ami.id}"
  availability_zone           = "ap-south-1a"
  instance_type               = "t2.micro"
  key_name                    = "charankey"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "${var.ec2_name}"
    Env  = "Test"
  }
}

resource "aws_instance" "web" {
  ami                    = "ami-0cc0a36f626a4fdf5"
  instance_type          = var.vm_config.vm_size
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = var.vm_config.name
  }
}

resource "aws_security_group" "allow_all" {
  name = "allow_all"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["178.150.93.125/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["178.150.93.125/32"]
  }
}

resource "aws_eip" "iptoweb" {
  instance = "${aws_instance.web.id}"
  vpc      = true
}

resource "aws_volume_attachment" "hdd" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.tohdd.id}"
  instance_id = "${aws_instance.web.id}"
}

resource "aws_volume_attachment" "ssd" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.tossd.id}"
  instance_id = "${aws_instance.web.id}"
}

resource "aws_ebs_volume" "tohdd" {
  availability_zone = "eu-central-1"
  size              = 1
}

resource "aws_ebs_volume" "tossd" {
  availability_zone = "eu-central-1"
  size              = 1
}

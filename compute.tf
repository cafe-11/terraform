data "aws_ami" "server_ami" {
  most_recent = true
  owners = ["137112412989"]

  filter {
      name = "owner-alias"
      values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*-x86_64-gp2"]
  }
}
resource "aws_instance" "web-ec2" {
  count         = var.instance_count
  instance_type = var.instance_type
  ami           = data.aws_ami.server_ami.id
  key_name      = var.instance_key_name
  #iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  #user_data     = templatefile("../modules/services/infra_services/userdata.tpl", {})
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  subnet_id              = aws_subnet.public_subnet[count.index].id

  root_block_device {
    volume_size = var.vol_size
  }

  tags = {
    Name = "${var.cloud_env}_webserver"
  }
}

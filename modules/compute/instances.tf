resource "aws_instance" "node-a" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_a_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.web_access_sg.id]
  user_data                   = file("./modules/compute/userdata.sh")

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = var.node_a_name
  }
}

resource "aws_instance" "node-b" {
  count                       = var.single_target ? 0 : 1
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_b_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.web_access_sg.id]
  user_data                   = file("./modules/compute/userdata.sh")
  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = var.node_b_name
  }
}
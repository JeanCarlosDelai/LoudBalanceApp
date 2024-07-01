resource "aws_key_pair" "LoudBalanceApp_key" {
  key_name   = "LoudBalanceApp"
  public_key = local.public_key
}

resource "aws_instance" "LoudBalanceApp1" {
  ami                         = "ami-053602453dbcba9be" # Amazon Linux 2 AMI
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_1_id
  security_groups             = [var.security_group_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.LoudBalanceApp_key.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd git
              service httpd start
              chkconfig httpd on
              cd /var/www/html
              git clone https://github.com/JeanCarlosDelai/LoudBalanceApp-1.git
              cp LoudBalanceApp-1/index.html /var/www/html/index.html
              sudo chown -R $USER .git
              sudo chown -R $USER /var/www/html
                EOF

  tags = {
    Name = "LoudBalanceApp1"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip_LoudBalanceApp1.txt"
  }

  provisioner "local-exec" {
    command = "echo ${self.id} >> id_LoudBalanceApp1.txt"
  }
}

resource "aws_key_pair" "LoudBalanceApp2_key" {
  key_name   = "LoudBalanceApp2_key"
  public_key = local.public_key
}

resource "aws_instance" "LoudBalanceApp2" {
  ami                         = "ami-053602453dbcba9be"
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_2_id
  security_groups             = [var.security_group_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.LoudBalanceApp_key.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd git
              service httpd start
              chkconfig httpd on
              cd /var/www/html
              git clone https://github.com/JeanCarlosDelai/LoudBalanceApp-2.git
              cp LoudBalanceApp-2/index.html /var/www/html/index.html
              sudo chown -R $USER .git
              sudo chown -R $USER /var/www/html
                EOF

  tags = {
    Name = "LoudBalanceApp2"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip_LoudBalanceApp2.txt"
  }

  provisioner "local-exec" {
    command = "echo ${self.id} >> id_LoudBalanceApp2.txt"
  }
}




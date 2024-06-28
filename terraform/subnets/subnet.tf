resource "aws_subnet" "subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block_subnet_1
  availability_zone = var.availability_zone_a

   provisioner "local-exec" {
    command = "echo ${self.id} >> subnet_1.txt"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block_subnet_2
  availability_zone = var.availability_zone_c

  provisioner "local-exec" {
    command = "echo ${self.id} >> subnet_2.txt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id =var.route_table_id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = var.route_table_id
}


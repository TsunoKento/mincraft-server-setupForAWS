data "aws_ssm_parameter" "amzn2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "mincraft_instance" {
  ami                         = data.aws_ssm_parameter.amzn2_ami.value
  instance_type               = "t3.large"
  subnet_id                   = aws_subnet.mincraft_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.mincraft_sg.id]
  key_name                    = aws_key_pair.key_pair.id
  associate_public_ip_address = "true"

  tags = {
    "Name" = "mincraft_instance"
  }
}

output "ip_of_EC2" {
  value = aws_instance.mincraft_instance.public_ip
}

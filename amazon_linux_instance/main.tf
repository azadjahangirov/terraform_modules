data "aws_ami" "latest_amazon_linux" {
  owners = ["137112412989"]
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "amazon_linux" {
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  tags = {
    Name = "amazon_linux"
  }
}
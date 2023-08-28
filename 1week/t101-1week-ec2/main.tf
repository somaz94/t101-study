provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-084e92d3e117f7692"
  instance_type = "t2.micro"

  tags = {
    Name = "t101-study"
  }

}

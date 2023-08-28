terraform {
  required_version = ">= 1.0.0"
}

resource "local_file" "abc" {
  content  = "abc!"
  filename = "${path.module}/abc.txt" 
}

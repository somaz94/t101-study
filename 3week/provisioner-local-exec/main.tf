resource "null_resource" "example1" {
  
  provisioner "local-exec" {
    command = <<EOF
      echo Hello!! > file.txt
      echo $ENV >> file.txt
      EOF
    
    interpreter = [ "bash" , "-c" ]

    working_dir = "/tmp"

    environment = {
      ENV = "world!!"
    }

  }
}

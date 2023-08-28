resource "local_file" "abc" {
  content  = "step7 file ok"
  filename = "${path.module}/step7.txt"

  lifecycle {
    postcondition {
      condition     = self.content != ""
      error_message = "content cannot empty"
    }
  }
}

output "step7_content" {
  value = local_file.abc.id
}

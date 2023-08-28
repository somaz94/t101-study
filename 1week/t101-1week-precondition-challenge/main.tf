variable "file_name" {
  description = "Name of the file."
  type        = string
  default     = "step0.txt"
}

resource "local_file" "abc" {
  content  = "This is a lifecycle exercise in Terraform."
  filename = "${path.module}/${var.file_name}"

  lifecycle {
    precondition {
      condition     = can(regex("^step[0-6]\\.txt$", var.file_name))
      error_message = "File name should be between step0.txt to step6.txt"
    }

    postcondition {
      condition     = self.content != ""
      error_message = "Content cannot be empty"
    }
  }
}

output "file_content" {
  value = local_file.abc.content
}

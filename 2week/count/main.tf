resource "local_file" "abc" {
  count    = 5
  content  = "abc${count.index}"
  filename = "${path.module}/abc${count.index}.txt"
}

output "fileid" {
  value = local_file.abc.*.id
}

output "filename" {
  value = local_file.abc.*.filename
}

output "filecontent" {
  value = local_file.abc.*.content
}

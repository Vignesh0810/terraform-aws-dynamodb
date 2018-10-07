output "table_id" {
  description = "Table name"
  value       = "${aws_dynamodb_table.table.id}"
}

output "table_id" {
    value = "${aws_dynamodb_table.table.id}"
}

output "table_hash_key" {
    value = "${aws_dynamodb_table.table.hash_key}"
}
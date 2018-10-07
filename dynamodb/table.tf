resource "aws_dynamodb_table" "table" {
  name = "${var.name}"

  read_capacity  = "${var.read_capacity}"
  write_capacity = "${var.write_capacity}"

  attribute = "${var.attributes}"

  # Partion key 
  hash_key  = "${var.hash_key}"
  range_key = "${var.range_key}"


  point_in_time_recovery {
    enabled =  true
  }
  server_side_encryption {
    enabled = true
  }

  # LSI - Local secondary index
  local_secondary_index = "${var.local_secondary_indexes}"

  # GSL - Global secondary index
  global_secondary_index = "${var.global_secondary_indexes}"

  ttl = "${var.ttl}"
  stream_enabled = "${var.stream_enabled}"
  stream_view_type = "${var.stream_view_type}"
}
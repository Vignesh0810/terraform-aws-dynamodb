# GSI - Global secondary index READ capacity autoscaling configuration
resource "aws_appautoscaling_target" "index_read" {
  count              = "${length(var.global_secondary_indexes)}"
  max_capacity       = "${var.max_read_capacity}"
  min_capacity       = "${lookup(var.global_secondary_indexes[count.index],"read_capacity")}"
  resource_id        = "table/${var.name}/index/${lookup(var.global_secondary_indexes[count.index],"name")}"
  scalable_dimension = "dynamodb:index:ReadCapacityUnits"
  service_namespace  = "dynamodb"
  depends_on         = ["aws_dynamodb_table.table"]
}

resource "aws_appautoscaling_policy" "index_read" {
  count              = "${length(var.global_secondary_indexes)}"
  name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.index_read.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = "${aws_appautoscaling_target.index_read.resource_id}"
  scalable_dimension = "${aws_appautoscaling_target.index_read.scalable_dimension}"
  service_namespace  = "${aws_appautoscaling_target.index_read.service_namespace}"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = "${var.threshold}"
  }

  depends_on = ["aws_dynamodb_table.table"]
}

# GSI - Global secondary index WRITE capacity autoscaling configuration
resource "aws_appautoscaling_target" "index_write" {
  count              = "${length(var.global_secondary_indexes)}"
  max_capacity       = "${var.max_write_capacity}"
  min_capacity       = "${lookup(var.global_secondary_indexes[count.index],"write_capacity")}"
  resource_id        = "table/${var.name}/index/${lookup(var.global_secondary_indexes[count.index],"name")}"
  scalable_dimension = "dynamodb:index:WriteCapacityUnits"
  service_namespace  = "dynamodb"
  depends_on         = ["aws_dynamodb_table.table"]
}

resource "aws_appautoscaling_policy" "index_write" {
  count              = "${length(var.global_secondary_indexes)}"
  name               = "DynamoDBWriteCapacityUtilization:${aws_appautoscaling_target.index_write.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = "${aws_appautoscaling_target.index_write.resource_id}"
  scalable_dimension = "${aws_appautoscaling_target.index_write.scalable_dimension}"
  service_namespace  = "${aws_appautoscaling_target.index_write.service_namespace}"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = "${var.threshold}"
  }

  depends_on = ["aws_dynamodb_table.table"]
}

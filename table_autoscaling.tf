# Table READ capacity autoscaling configuration
resource "aws_appautoscaling_target" "read" {
  max_capacity       = "${var.max_read_capacity}"
  min_capacity       = "${var.read_capacity}"
  resource_id        = "table/${var.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
  depends_on         = ["aws_dynamodb_table.table"]
}

resource "aws_appautoscaling_policy" "read" {
  name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.read.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = "${aws_appautoscaling_target.read.resource_id}"
  scalable_dimension = "${aws_appautoscaling_target.read.scalable_dimension}"
  service_namespace  = "${aws_appautoscaling_target.read.service_namespace}"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = "${var.threshold}"
  }

  depends_on = ["aws_dynamodb_table.table"]
}

# Table READ capacity autoscaling configuration
resource "aws_appautoscaling_target" "write" {
  max_capacity       = "${var.max_write_capacity}"
  min_capacity       = "${var.write_capacity}"
  resource_id        = "table/${var.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
  depends_on         = ["aws_dynamodb_table.table"]
}

resource "aws_appautoscaling_policy" "write" {
  name               = "DynamoDBWriteCapacityUtilization:${aws_appautoscaling_target.write.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = "${aws_appautoscaling_target.write.resource_id}"
  scalable_dimension = "${aws_appautoscaling_target.write.scalable_dimension}"
  service_namespace  = "${aws_appautoscaling_target.write.service_namespace}"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = "${var.threshold}"
  }

  depends_on = ["aws_dynamodb_table.table"]
}

## Read recomendation https://aws.amazon.com/blogs/aws/now-available-global-secondary-indexes-for-amazon-dynamodb/

module "order_history" {
    source = "dynamodb"

    name = "order-history"

    attributes = [{
        name = "customerId"
        type = "S"
    },{
        name = "date"
        type = "S"
    },{
        name = "city"
        type = "S"
    }, {
        name = "zipCode"
        type = "N"
    }]

    hash_key  = "customerId"
    range_key = "date"
    
    # You can define a maximum of 5 local secondary indexes and 5 global secondary indexes per table.
    local_secondary_indexes = [{
        name               = "customerId-city-index"
        range_key          = "city"
        projection_type    = "ALL" # ALL, INCLUDE or KEYS_ONLY
        non_key_attributes = []
    }]

    global_secondary_indexes = [{
        name               = "zip_code-index"
        hash_key           = "zip_code"
        range_key          = "date"
        read_capacity      = "5"
        write_capacity     = "5"
        projection_type    = "ALL" # ALL, INCLUDE or KEYS_ONLY
        non_key_attributes = []
    }]
}


# Example of table item. Remember the table is schemaless, you can add other attributes.
resource "aws_dynamodb_table_item" "order_history" {
  table_name = "${module.order_history.table_id}"
  hash_key = "${module.order_history.table_hash_key}"
  item = <<ITEM
{
  "customerId": {"S": "Julian"},
  "date": {"N": "Today"},
  "city": {"S": "Amsterdam"},
  "zipCode": {"N": "1234"},
  "price" : {"N": "10"}
}
ITEM
}
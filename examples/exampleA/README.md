## Example

* A Table with hash/sort key, global and local secondary index


```
module "order_history" {
  source = "../../"

  name = "order-history"

  attributes = [{
    name = "customerId"
    type = "S"
  },
    {
      name = "date"
      type = "S"
    },
    {
      name = "city"
      type = "S"
    },
    {
      name = "zipCode"
      type = "N"
    },
  ]

  hash_key  = "customerId"
  range_key = "date"

  # You can define a maximum of 5 local secondary indexes and 5 global secondary indexes per table.
  local_secondary_indexes = [{
    name               = "customerId-city-index"
    range_key          = "city"
    projection_type    = "ALL"                   # ALL, INCLUDE or KEYS_ONLY
    non_key_attributes = []
  }]

  global_secondary_indexes = [{
    name               = "zipCode-index"
    hash_key           = "zipCode"
    range_key          = "date"
    read_capacity      = "5"
    write_capacity     = "5"
    projection_type    = "ALL"           # ALL, INCLUDE or KEYS_ONLY
    non_key_attributes = []
  }]
}
```
# terraform-dynamodb
Terraform module for AWS Dynamodb tables

If you are super new with terraform check this out first! 

https://www.terraform.io/docs/providers/aws/ and https://www.terraform.io/docs/backends/types/s3.html

```
IMPORTANT! 
You can define a maximum of 5 local secondary indexes and 5 global secondary indexes per table.
Maximum autoscaling capacity and threshold default configuration can be overwritten from module or dynamodb/variables.tf
```

## Examples

1. Table with hash/sort key, global and local secondary index
2. Table with only a hash key
3. Table with hash and sort key

## Features
* Autoscaling
* Point-in-time recovery
* Server side encryption
* Local secondary index creation - optional
* Global secondary index creation and autoscaling - optional
* TTL - optional
* Stream - optional

## Run it!

* terraform init
* terraform plan
* terraform apply
* terraform destroy

## Official documentation

* Indexes
    * https://aws.amazon.com/blogs/aws/now-available-global-secondary-indexes-for-amazon-dynamodb/

* Limits 
    * https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html

* Terraform resources
    * aws_dynamodb_table
        * https://www.terraform.io/docs/providers/aws/r/dynamodb_table.html
    * aws_appautoscaling_policy  
        * https://www.terraform.io/docs/providers/aws/r/appautoscaling_policy.html


Feel free to contact me!


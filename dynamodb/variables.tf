
# Table configuration variables 
variable "name" {}
variable "read_capacity" { default = "5"}
variable "write_capacity" { default = "5" }
variable "attributes" { type = "list"}
variable "hash_key" {}
variable "range_key" { type = "string" default=""}
variable "local_secondary_indexes" { type = "list" default=[]}
variable "global_secondary_indexes" { type = "list" default=[]}

# Table/index default autoscaling configuration variables - you overwrite from module initizalization
variable "max_read_capacity" { default = "700"}
variable "max_write_capacity" { default = "700" }
variable "threshold" { default = 70}

# Advanced table configuration variables
variable "ttl" { type = "list" default = []}
variable "stream_enabled" { type = "string" default = "false"}
variable "stream_view_type" { type = "string" default = ""}


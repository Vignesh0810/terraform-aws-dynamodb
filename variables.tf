# Table configuration variables 
variable "name" {
  description = "Table name"
}

variable "read_capacity" {
  description = "Table read capacity"
  default     = "5"
}

variable "write_capacity" {
  description = "Table write capacity"

  default = "5"
}

variable "attributes" {
  description = "Table attributes"

  type = "list"
}

variable "hash_key" {
  description = "Table hash/partion key"
}

variable "range_key" {
  description = "Table sort/range key"

  type = "string"

  default = ""
}

variable "local_secondary_indexes" {
  description = "Table local secondary index list"

  type = "list"

  default = []
}

variable "global_secondary_indexes" {
  description = "Table global secondary index list"

  type = "list"

  default = []
}

# Table/index default autoscaling configuration variables - you overwrite from module initizalization
variable "max_read_capacity" {
  description = "Table/index maxixum read capacity"

  default = "700"
}

variable "max_write_capacity" {
  description = "Table/index maxixum write capacity"

  default = "700"
}

variable "threshold" {
  description = "Table/index autoscaling threshold"

  default = 70
}

# Advanced table configuration variables
variable "ttl" {
  description = "Table iteams TimeToLive"

  type = "list"

  default = []
}

variable "stream_enabled" {
  description = "Table stream"

  type = "string"

  default = "false"
}

variable "stream_view_type" {
  description = "Table stream view type"

  type = "string"

  default = ""
}

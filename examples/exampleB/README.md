## Example

* A Table with hash key


```
module "students" {
  source = "../../"

  name = "students"

  attributes = [{
    name = "studentId"
    type = "S"
  }]

  hash_key = "studentId"
}
```
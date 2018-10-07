module "students" {
    source = "dynamodb"

    name = "students"

    attributes = [{
        name = "studentId"
        type = "S"
    }]

    hash_key  = "studentId"
}
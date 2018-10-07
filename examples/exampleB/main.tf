module "students" {
    source = "../../"

    name = "students"

    attributes = [{
        name = "studentId"
        type = "S"
    }]

    hash_key  = "studentId"
}

provider "aws" {
    region = "eu-west-1"
}

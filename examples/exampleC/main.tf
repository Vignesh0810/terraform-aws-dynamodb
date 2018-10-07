module "tickets" {
    source = "../../"

    name = "tickets"

    attributes = [{
        name = "ticketId"
        type = "S"
    },
    {
        name = "timestamp"
        type = "S"
    }]

    hash_key  = "ticketId"
    range_key  = "timestamp"
}

provider "aws" {
    region = "eu-west-1"
}
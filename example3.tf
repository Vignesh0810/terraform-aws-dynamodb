module "tickets" {
    source = "dynamodb"

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
    sort_key  = "timestamp"
}
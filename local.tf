# whenever you have common fiels or anything which is highly used, you can consider that in locals and call it on your need

locals {
    RDS_USER      = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["DOCDB_USERNAME"]
    RDS_PASSWORD  = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["DOCDB_PASSWORD"]
}
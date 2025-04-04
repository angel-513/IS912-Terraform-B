variable "subscription_id" {
    type = string
    description = "The Azure subscription ID"
}

variable "location" {
    type = string
    description = "The Azure region to deploy resources in"
    default = "Central US"
}

variable "project" {
    type = string
    description = "The name of the project"
    default = "ecommerce"
}

variable "environment" {
    type = string
    description = "The environment name"
    default = "dev"
}

variable "tags" {
    type = map(string)
    description = "Tags to apply to resources"
    default = {
        environment = "development"
        date = "abr-2025"
        createdBy = "terraform"
    }
}

variable "admin_sql_password" {
    type = string
    description = "The password for the SQL Server administrator login"
}
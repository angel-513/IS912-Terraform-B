resource "azurerm_service_plan" "spbackoffice" {
    name = "spbackbackoffice-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name = "B1"
    os_type = "Linux"
}

resource "azurerm_linux_web_app" "webappuibackoffice" {
    name = "uibackoffice-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.spbackoffice.id

    site_config {
        always_on = true
    }

    app_settings = {
        WEBSITES_PORT = "80"
    }

    tags = var.tags
}

resource "azurerm_linux_web_app" "webappapibackoffice" {
    name = "apibackoffice-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.spbackoffice.id

    site_config {
        always_on = true
    }

    app_settings = {
        WEBSITES_PORT = "80"
    }

    tags = var.tags
}
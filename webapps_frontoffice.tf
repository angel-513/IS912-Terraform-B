resource "azurerm_service_plan" "spfrontfrontoffice" {
    name = "spfrontfrontoffice-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name = "B1"
    os_type = "Linux"
}

resource "azurerm_service_plan" "spbackfrontoffice" {
    name = "spbackfrontoffice-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name = "B1"
    os_type = "Linux"
}

resource "azurerm_static_web_app" "website" {
    name = "website-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_tier = "Free"
}

resource "azurerm_linux_web_app" "webappuifrontoffice" {
    name = "uifrontoffice-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.spfrontfrontoffice.id

    site_config {
        always_on = true
    }

    app_settings = {
        WEBSITES_PORT = "80"
    }

    tags = var.tags
}

resource "azurerm_linux_web_app" "webappapifrontoffice" {
    name = "apifrontoffice-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.spbackfrontoffice.id

    site_config {
        always_on = true
    }

    app_settings = {
        WEBSITES_PORT = "80"
    }

    tags = var.tags
}
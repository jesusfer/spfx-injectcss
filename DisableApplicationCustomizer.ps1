$tenantUrl = "https://<your-tenant>.sharepoint.com/sites/<your-site>"
$tenantId = "<your-tenant>.onmicrosoft.com"
$tenantUrl = "https://<your-tenant>.sharepoint.com/sites/<your-site>"
$clientId = "00000000-0000-0000-0000-000000000000"

Connect-PnPOnline $tenantUrl -ClientId $clientId -Tenant $tenantId -DeviceLogin

# Connect to tenant
Get-PnPCustomAction | Where-Object Name -eq "InjectCssApplicationCustomizer" | Remove-PnPCustomAction


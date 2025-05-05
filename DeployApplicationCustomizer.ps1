# Build the solution as prod
gulp package-solution --ship

# Use this file to deploy the extension to your application catalog
$tenantId = "<your-tenant>.onmicrosoft.com"
$tenantUrl = "https://<your-tenant>.sharepoint.com"
$clientId = "00000000-0000-0000-0000-000000000000"

Connect-PnPOnline $tenantUrl -ClientId $clientId -Tenant $tenantId -DeviceLogin

Add-PnPApp -path .\sharepoint\solution\spfx-injectcss.sppkg -Publish -Overwrite #-SkipFeatureDeployment

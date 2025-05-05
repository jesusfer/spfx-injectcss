# Change these variables to enable the extension
$customCSSUrl = "/sites/some-site/SiteAssets/custom.css"
$tenantId = "<your-tenant>.onmicrosoft.com"
$tenantUrl = "https://<your-tenant>.sharepoint.com"
$clientId = "00000000-0000-0000-0000-000000000000"

Connect-PnPOnline $tenantUrl -ClientId $clientId -Tenant $tenantId -DeviceLogin

# Connect to tenant
$context = Get-PnPContext
$web = Get-PnPWeb
$context.Load($web)
Invoke-PnPQuery

# Deploy custom action
$ca = $web.UserCustomActions.Add()
$ca.ClientSideComponentId = "5a1fcffd-dfeb-4844-b478-1feb4325a5a7"
$ca.ClientSideComponentProperties = @{cssurl = $customCSSUrl } | ConvertTo-Json
$ca.Location = "ClientSideExtension.ApplicationCustomizer"
$ca.Name = "InjectCssApplicationCustomizer"
$ca.Title = "Inject CSS Application Extension"
$ca.Description = "Injects custom CSS to make minor style modifications to SharePoint Online"
$ca.Update()

$context.Load($web.UserCustomActions)
Invoke-PnPQuery


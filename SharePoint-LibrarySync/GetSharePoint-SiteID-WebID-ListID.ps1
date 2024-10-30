#Want to give credit to where I got the info from. I put them together into one script. Links below. 
#Read more: https://www.sharepointdiary.com/2018/08/get-list-id-sharepoint-online-powershell.html#ixzz8kP4MFV5v
#Read more: https://www.sharepointdiary.com/2018/04/sharepoint-online-powershell-to-get-site-collection-web-id.html#ixzz8kOye4ywE

#Parameter
$SiteURL = "SiteURL EX: https://SiteName.sharepoint.com/sites/site"
$ListName = "ListName"
 
#Get Credentials to connect
$Cred= Get-Credential
  
#Setup the context
$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
$Ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Cred.Username, $Cred.Password)
 
#Get Site and Web Objects
$Ctx.Load($Ctx.Site)
$Ctx.Load($Ctx.Web)
$Ctx.ExecuteQuery()

#Get the List
$List = $Ctx.Web.Lists.GetByTitle($ListName)
$Ctx.Load($List)
$Ctx.ExecuteQuery()

 
#sharepoint online powershell get site collection id
Write-host -f Green "Site ID:"$Ctx.Site.Id
 
#sharepoint online powershell get site id
Write-host -f Green "Web ID:"$Ctx.Web.Id

#Get List GUID
Write-host -f Green "List ID:"$List.Id

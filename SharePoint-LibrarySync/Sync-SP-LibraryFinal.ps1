# Define the local path where the SharePoint library is synced
$localPath = "$env:USERPROFILE\SharePoint Site Name\WebTitle + ListTitle goes here"

# Check if the local path exists
if (Test-Path -Path $localPath) {
    Write-Output "The document library is already synced."
    exit
} else {
    Write-Output "The document library is not synced. Proceeding with sync..."
    # Your existing sync logic goes here
    # Example: Start-SyncLibrary -Path $localPath -SharePointUrl "https://yoursharepointsite.com/library"
}

# Your existing script continues here

Add-Type -AssemblyName System.Web
$WebURL = [System.Web.HttpUtility]::UrlEncode("WebURL")
$SiteID = [System.Web.HttpUtility]::UrlEncode("SiteID")
$WebID = [System.Web.HttpUtility]::UrlEncode("WebID")
$ListID = [System.Web.HttpUtility]::UrlEncode("ListID")
$WebTitle = [System.Web.HttpUtility]::UrlEncode("WebTitle")
$ListTitle = [System.Web.HttpUtility]::UrlEncode("ListTitle")
#$ListTitle = "ListTitle if it has spaces in the name" -replace " ", "%20"  # Manually replace spaces with %20

# Give Windows some time to load before getting the email address
Start-Sleep -s 20

$UserName = $env:USERNAME
$Domain = "Domain Name"

Write-Output "Configure OneDrive"
$odopen = "odopen://sync/?onPrem=0&webTemplate=68&libraryType=4&siteId=" + $SiteID + "&webId=" + $WebID + "&webUrl=" + $webURL + "&listId=" + $ListID + "&userEmail=" + $UserName + $Domain + "&webTitle=" + $WebTitle + "&ListTitle=" + $ListTitle

Start-Process $odopen
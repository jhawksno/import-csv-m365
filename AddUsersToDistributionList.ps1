# Check if the Exchange Online Management module is installed
if (!(Get-Module -ListAvailable -Name ExchangeOnlineManagement)) {
    # Install the Exchange Online Management module if it is not installed
    Install-Module -Name ExchangeOnlineManagement -Force
}

# Import the Exchange Online Management module
Import-Module ExchangeOnlineManagement

# Check if the user is already logged in
$session = Get-Module -Name ExchangeOnlineManagement | Get-Variable -Name 'ExchangeOnlineSession' -ErrorAction SilentlyContinue
if ($null -eq $session) {
    # Connect to Exchange Online using browser authentication
    Connect-ExchangeOnline -ShowProgress $true
}

# Prompt the user for the CSV file path and distribution list name
$csvFilePath = Read-Host -Prompt "Enter the path to your CSV file"
$distributionList = Read-Host -Prompt "Enter the name of your distribution list"

# Import CSV and add users to the distribution list
$contacts = Import-Csv -Path $csvFilePath
foreach ($contact in $contacts) {
    try {
        Add-DistributionGroupMember -Identity $distributionList -Member $contact.EmailAddress -ErrorAction Stop
        Write-Host "Successfully added $($contact.EmailAddress) to $distributionList"
    } catch {
        Write-Host "Failed to add $($contact.EmailAddress) to $distributionList"
    }
}

# Ask the user if they want to disconnect from Exchange Online
$disconnect = Read-Host -Prompt "Do you want to disconnect from Exchange Online? (yes/no)"
if ($disconnect -eq "yes") {
    # Disconnect from Exchange Online
    Disconnect-ExchangeOnline -Confirm:$false
    Write-Host "Disconnected from Exchange Online"
} else {
    Write-Host "You are still connected to Exchange Online"
}

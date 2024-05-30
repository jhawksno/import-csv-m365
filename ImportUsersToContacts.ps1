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

# Import Contacts to M365
$csvFilePath = Read-Host -Prompt "Enter the path to your CSV file"
$contacts = Import-Csv -Path $csvPath

# Create the contacts from the csv file and create a Display Name
foreach ($contact in $contacts) {
    $name = $contact.EmailAddress.Split('@')[0]  # Create a Name from the email address
    New-MailContact -Name $name -ExternalEmailAddress $contact.EmailAddress
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
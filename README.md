# Import CSV to M365 Distribution List

This is a PowerShell script that will import a csv file and assign users to a Microsoft 365 Distributioin List or Group.

# Pre-requisites:

# Ensure Exchange Online Management module is installed
Install-Module -Name ExchangeOnlineManagement -Force

# Import the Exchange Online Management module
Connect-ExchangeOnline -UserPrincipalName $UserCredential.UserName -ShowProgress $true



# PowerShell Scripts to Import CSV to Microsoft 365

## Import CSV to M365 Distribution List
### AddUsersToDistributionLists.ps1 (Version 1.0)

This is a PowerShell script that will import a csv file and assign users to a Microsoft 365 Distributioin List or Group.

**Features:**
- Checks if the Exchange Online Management module is installed and install it if required
- Automatically imports the Exchange Online Mangement module
- Check if the user is already connected to the Exchange Online Mangement Module
- Prompt user for CSV file path
- Prompt for name of the Distribution List
- Provides visual feedback for each entry being imported

## Import CSV to M365 Contacts
### ImportUsersToContacts.ps1 (Version 1.0)

This is a PowerShell script that will import a list of user email addresses from a CSV file, generate a Display Name and them to M365 Contacts. 

**Features:**
- Checks if the Exchange Online Management module is installed and install it if required
- Automatically imports the Exchange Online Mangement module
- Check if the user is already connected to the Exchange Online Mangement Module
- Prompt user for CSV file path
- Automatically generate a Display Name from an email address





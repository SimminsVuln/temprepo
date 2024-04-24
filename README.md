The following is the powershell script for whois lookup. You can copy and paste it into a text editor and save it as a .ps1 file, or run it directly from the powershell console.
# Define the whois API URL
$whoisApi = "[URL]="
# Prompt the user to enter a domain or IP address
$domainOrIp = Read-Host "Enter a domain or IP address"
# Validate the input
if ($domainOrIp -match "^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" -or $domainOrIp -match "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$") {
# Append the input to the API URL
$url = $whoisApi + $domainOrIp
# Invoke the API and convert the JSON response to a powershell object
$response = Invoke-RestMethod -Uri $url | ConvertFrom-Json
# Check if the response contains an error
if ($response.error) {
# Display the error message
Write-Host $response.error -ForegroundColor Red
}
else {
# Display the whois information in a table
$response | Format-Table -AutoSize
}
}
else {
# Display an invalid input message
Write-Host "Invalid input. Please enter a valid domain or IP address." -ForegroundColor Yellow
}
Usage
To use the script, you need to have powershell installed on your system. You can check the version of powershell by running the following command in the powershell console:
$PSVersionTable.PSVersion
The script requires powershell version 3.0 or higher, which supports the Invoke-RestMethod cmdlet. If you have an older version of powershell, you can update it from the Microsoft website.
To run the script, you can either execute it from the powershell console, or right-click on the .ps1 file and select "Run with PowerShell". You will be prompted to enter a domain or IP address, and the script will display the whois information in a table. 

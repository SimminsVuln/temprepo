# Define your API headers
$headers = @{
    "accept"   = "application/json"
    "x-apikey" = "be3f59a21a40869f2b82d94e29cdd5f9f97d99da68890dfe64a163dcfed6253f"
}

# Read input CSV which has a column named 'cve_ids'
$inputFile = "VulnTracker.csv"
$outputFile = "mandiant.csv"
$csvData = Import-Csv -Path $inputFile

# Prepare an array to hold the updated rows
$resultsArray = @()

# Collect existing CVE IDs from the output file if it exists
if (Test-Path $outputFile) {
    $existingData = Import-Csv -Path $outputFile
    $existingCVEs = $existingData.cve_ids
} else {
    $existingData = @()
    $existingCVEs = @()
}

# Collect existing CVE IDs from the input CSV to avoid duplicate processing
$inputCVEs = $csvData.cve_ids

foreach ($row in $csvData) {
    $cve = $row.cve_ids

    # Skip API call if the CVE already exists in the output CSV
    if ($existingCVEs -contains $cve) {
        Write-Output "CVE $cve already exists in the output CSV. Skipping API call..."
        continue
    }

    # Build the endpoint URL using the CVE
    $apiUrl = "https://www.virustotal.com/api/v3/collections/vulnerability--$cve"
    
    Write-Output "Querying API for CVE: $cve"
    try {
        $response = Invoke-WebRequest -Uri $apiUrl -Method GET -Headers $headers -ErrorAction Stop
        $jsonData = $response.Content | ConvertFrom-Json
    }
    catch {
        Write-Output "Error querying API for CVE $cve. Skipping..."
        $jsonData = $null
    }

    # Initialize default values for the fields
    $cvssv3_Score = "not available"
    $risk_rating = "not available"
    $exploitation_state = "not available"
    $exploitation = "not available"
    $predicted_risk_rating = "not available"
    $exploit_availability = "not available"
    $cisa_known_exploited = "not available"

    # Process the JSON if valid data is returned
    if ($jsonData -and $jsonData.data -and $jsonData.data.attributes) {
        $attr = $jsonData.data.attributes

        if ($attr.cvss -and $attr.cvss.cvssv3_x -and $attr.cvss.cvssv3_x.base_score) {
            $cvssv3_Score = $attr.cvss.cvssv3_x.base_score
        }

        if ($attr.risk_rating) { $risk_rating = $attr.risk_rating }
        if ($attr.exploitation_state) { $exploitation_state = $attr.exploitation_state }
        if ($attr.predicted_risk_rating) { $predicted_risk_rating = $attr.predicted_risk_rating }
        if ($attr.exploit_availability) { $exploit_availability = $attr.exploit_availability }
        
        if ($attr.exploitation -and $attr.exploitation.first_exploitation) {
            $exploitation = $attr.exploitation.first_exploitation
        }

        if ($attr.cisa_known_exploited -and $attr.cisa_known_exploited.date_added) {
            try {
                $unixTime = [Int64]$attr.cisa_known_exploited.date_added
                $dateObj = [DateTimeOffset]::FromUnixTimeSeconds($unixTime).DateTime
                $cisa_known_exploited = $dateObj.ToString("MM-dd-yyyy")
            }
            catch {
                $cisa_known_exploited = "not available"
            }
        }
    }

    # Create a new PSObject that combines the original row with the new columns
    $newRow = New-Object PSObject

    # Add timestamp at the beginning
    $timestamp = (Get-Date).ToString("MM/dd/yyyy")
    $newRow | Add-Member -MemberType NoteProperty -Name "timestamp" -Value $timestamp

    # Copy all original properties
    foreach ($property in $row.PSObject.Properties.Name) {
        $newRow | Add-Member -MemberType NoteProperty -Name $property -Value $row.$property
    }

    # Add new columns
    $newRow | Add-Member -MemberType NoteProperty -Name "CVSS" -Value $cvssv3_Score
    $newRow | Add-Member -MemberType NoteProperty -Name "risk_rating" -Value $risk_rating
    $newRow | Add-Member -MemberType NoteProperty -Name "exploitation_state" -Value $exploitation_state
    $newRow | Add-Member -MemberType NoteProperty -Name "exploitation" -Value $exploitation
    $newRow | Add-Member -MemberType NoteProperty -Name "predicted_risk_rating" -Value $predicted_risk_rating
    $newRow | Add-Member -MemberType NoteProperty -Name "exploit_availability" -Value $exploit_availability
    $newRow | Add-Member -MemberType NoteProperty -Name "cisa_known_exploited" -Value $cisa_known_exploited

    # Add the new object to the results array
    $resultsArray += $newRow
}

# Combine existing data with new results
$finalResults = $existingData + $resultsArray

# Rearrange columns in the specified order with timestamp first
$orderedResults = $finalResults | Select-Object `
    timestamp, title, cve_ids, CVSS, Column4, risk_rating, exploitation_state, exploit_availability, detection, "analyst comment", Refs, predicted_risk_rating, cisa_known_exploited

# Export the updated CSV (append mode)
$orderedResults | Export-Csv -Path $outputFile -NoTypeInformation

Write-Output "Processing complete. See output file: $outputFile"

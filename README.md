d200c6346ca0deb5fc40fe34ec2fe18eaf4b9d72

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Max number of advistories to pull

$global:QueryLimit = 1500

#FileName

$FileName = "c:\api_advisories.csv"

function QueryData ($URL, $Header)

{

# Get First Page of results (20 items)

$result = @()

$results = @()

try

{

$result = Invoke-RestMethod ($URL) -Method Get -Headers $Header

$results = $result.results

if ($result.results)

{

$results = $result.results

}

else

{

$results = $result

}

}

catch

{

Write-host ("Error QueryData1 " + $URL + " " + $_.Exception.Message + " " + $_.Exception.ItemName) -ForegroundColor Red

}

#Get the next pages of results, if any

while (![string]::IsNullOrWhiteSpace($result.next))

{

try

{

$result = Invoke-RestMethod $result.next -Method Get -Headers $Header

$results += $result.results

if ($results.count -gt $global:QueryLimit)

{

break;

}

}

catch

{ 

Write-host ("Error QueryData2 " + $URL + $result.next + " " + $_.Exception.Message + " " + $_.Exception.ItemName) -ForegroundColor Red

return $results

}

}

return $results

}

function CallAPI ($URL, $Header)

{

$Collection = QueryData $URL $Header

$CustomCollection = @()

foreach ($Advistory in $Collection)

{

#$Advistory

$advisoryDetails = QueryData ("https://api.app.secunia.com/api/advisories/" + $Advistory.id +"/") $Header

$products = ""

foreach ($product in $advisoryDetails.products)

{

$Productdata = QueryData ("https://api.app.flexerasoftware.com/api/product-releases/" + $product.id +"/") $Header

$products += $Productdata.name + ","

}

$Data = New-Object System.Object

$Data | Add-Member -MemberType NoteProperty -Name "id" -Value ($advisoryDetails.id -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "said" -Value ($advisoryDetails.advisory_identifier -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "criticality" -Value ($advisoryDetails.criticality -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "criticality_description" -Value ($advisoryDetails.criticality_description -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "title" -Value ($advisoryDetails.title -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "description" -Value ($advisoryDetails.description -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "solution" -Value ($advisoryDetails.solution -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "cvss_score" -Value ($advisoryDetails.cvss_score -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "cvss3_score" -Value ($advisoryDetails.cvss3_score -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "products" -Value ($products -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "cve_str_list" -Value ($advisoryDetails.cve_str_list -replace "\r\n", " ")

$Data | Add-Member -MemberType NoteProperty -Name "released" -Value ($advisoryDetails.released -replace "\r\n", " ")

$refs = ""

foreach ($ref in $advisoryDetails.references)

{

$refs += $ref.url + ","

}

$Data | Add-Member -MemberType NoteProperty -Name "Refs" -Value $refs

#$Data | Add-Member -MemberType NoteProperty -Name "references" -Value ($advisoryDetails.references -replace "\r\n", " ")

$CustomCollection += $Data

}

return $CustomCollection

}

$WebServiceHeader = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

$WebServiceHeader.Add("Content-Type", 'application/json')

$WebServiceHeader.Add("Authorization", "Token YOURTOKENHERE" )

$CustomCollection = CallAPI "https://api.app.secunia.com/api/advisories/?released__gte=1529038800000&released__lt=1530421199000" $WebServiceHeader

$CustomCollection | Export-Csv -path $FileName -NoTypeInformation

$CustomCollection

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Max number of advistories to pull

$global:QueryLimit = 1500

#FileName

$FileName = "[FILE PATH HERE]"

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


$Data | Add-Member -MemberType NoteProperty -Name "title" -Value ($advisoryDetails.title -replace "\r\n", " ")


$Data | Add-Member -MemberType NoteProperty -Name "cve_str_list" -Value ($advisoryDetails.cve_str_list -replace "\r\n", " ")


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

$WebServiceHeader.Add("Authorization", "Token [API TOKEN HERE]" )
 
$CustomCollection = CallAPI  "https://api.app.secunia.com/api/advisories/?released__gte=[UNIX TIME]&released__lt=[UNIX TIME]" $WebServiceHeader

$CustomCollection | Export-Csv -path $FileName -NoTypeInformation

$CustomCollection

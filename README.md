Hello Team,
A vendor recently released a security advisory for products that the combined bank may use. Please review the information below:

Name:
Windows Hyper-V NT Kernel Integration VSP Elevation of Privilege Vulnerability

Product:
Microsoft SQL Server 2022 for x64-based Systems (CU 13)
Microsoft SQL Server 2019 for x64-based Systems (CU 27)
Microsoft SQL Server 2022 for x64-based Systems (GDR)
Microsoft SQL Server 2017 for x64-based Systems (CU 31)
Microsoft SQL Server 2016 for x64-based Systems Service Pack 3 Azure Connect Feature Pack
Microsoft SQL Server 2016 for x64-based Systems Service Pack 3 (GDR)
Microsoft SQL Server 2019 for x64-based Systems (GDR)
Microsoft SQL Server 2017 for x64-based Systems (GDR)

CVEID:
CVE-2025-21333, CVE-2025-21334, CVE-2025-21335

Patch Available:
Yes 

If no patches are available, are mitigations available: N/A

Have any vulnerabilities been exploited in the wild: Yes
Is there POC code publicly available for these vulnerabilities: No

Original Advisory: 
https://msrc.microsoft.com/update-guide/vulnerability/CVE-2024-21333
https://msrc.microsoft.com/update-guide/vulnerability/CVE-2024-21334
https://msrc.microsoft.com/update-guide/vulnerability/CVE-2024-21335


import requests
import urllib

filters = "collection_type:vulnerability cvss_3x_base_score:4+ (exploitation_state:Confirmed or exploitation_state:Suspected)"
order = "risk_rating-"
url = f"https://www.virustotal.com/api/v3/collections?filter={urllib.parse.quote(filters)}&order={order}"
headers = {"accept": "application/json","x-apikey": <api-key>}
response = requests.get(url, headers=headers)

be3f59a21a40869 f2b8 2d94e29cdd5 f9f97d99da68 890dfe64a163d cfed6253f

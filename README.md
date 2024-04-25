CVE-2024-20353
An attacker could exploit this vulnerability to cause a denial of service condition by forcing a vulnerable device to reboot. An attacker would need to send a specially crafted request.


CVE-2024-20359
An attacker with local Administrator privileges could exploit this vulnerability to execute arbitrary code with root privileges. An attacker would need to craft a ZIP file containing several specific files related to plugin installation, including a 'csco-config.lua' file containing the code to execute. This file's name must match the regex string ' ^client-bundle[%w--]*%.zip$'. Then, an attacker must store the file in a vulnerable device's 'disk0:/' file system. Upon a device boot, this file will be extracted and the Lua file contained within will be executed with root privileges. This reboot can be facilitated using the vulnerability identified as CVE-2024-20353. Once this ZIP file is processed, the file will be deleted automatically.

Cisco Talos has published a blog post outlining exploitation of CVE-2024-20353 and CVE-2024-20359 in the ArcaneDoor exploitation campaign. It was used to deploy the Line Runner web shell in early January 2024.

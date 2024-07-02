CVE-2024-20399 - Cisco NX-OS Software CLI Command Injection Vulnerability

CVSS: 6.0
EPSS: TBD
Exploited in the Wild: Yes, Zero Day
PoC Code publically available: Yes
Detection Capability: Qualys QID in Development: QID 317465

A vulnerability in the CLI of Cisco NX-OS Software could allow an authenticated, local attacker to execute arbitrary commands as root on the underlying operating system of an affected device.This vulnerability is due to insufficient validation of arguments that are passed to specific configuration CLI commands. An attacker could exploit this vulnerability by including crafted input as the argument of an affected configuration CLI command. A successful exploit could allow the attacker to execute arbitrary commands on the underlying operating system with the privileges of root.

Cisco products if they were running a vulnerable release of Cisco NX-OS Software: Nexus 3000 Series Switches (CSCwj97009)1
Nexus 5500 Platform Switches (CSCwj97011)
Nexus 5600 Platform Switches (CSCwj97011)
Nexus 6000 Series Switches (CSCwj97011)
Nexus 7000 Series Switches (CSCwj94682)2
Nexus 9000 Series Switches in standalone NX-OS mode (CSCwj97009)
Note: To successfully exploit this vulnerability on a Cisco NX-OS device, an attacker must have Administrator credentials.


An attacker could exploit this vulnerability to execute commands as root on the underlying operating system of an affected device. An attacker would need to send a CLI command with malicious values in an argument of the command.

On July 1, 2024, Sygnia reported the Velvet Ant threat group exploited this vulnerability as a zero-day to install previously unknown malware on affected devices. For more information and recommended mitigations, please see Sygnia's report, "China-Nexus Threat Group ‘Velvet Ant’ Exploits Cisco Zero-Day (CVE-2024-20399) to Compromise Nexus Switch Devices – Advisory for Mitigation and Response."

Sources:
(1) https://sec.cloudapps.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-nxos-cmd-injection-xD9OhyOP
(2) https://www.sygnia.co/threat-reports-and-advisories/china-nexus-threat-group-velvet-ant-exploits-cisco-0-day/

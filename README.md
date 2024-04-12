Critical Pan-OS Vulnerability Exploited in the Wild: What You Need to Know

 

Palo Alto Networks has alerted customers that attackers are actively exploiting a critical command injection flaw PAN-OS firewall. The vulnerability, CVE-2024-3400, affects firewalls using certain versions of PAN-OS and has been assigned a CVSS of 10.

 

A command injection flaw in the GlobalProtect and device telemetry features for certain PAN-OS versions may allow an unauthenticated attacker to run arbitrary code with root privileges on the firewall. Palo Alto Networks states that currently there are a limited number of attacks that are using this vulnerability. However, security researchers estimate that there may as many as 82,000 devices online that are exposed. Palo-Alto has not yet revealed details on how this vulnerability is being used.

 

PAN-OS 10.2, 11.0, and 11.1 are the versions that are at risk (see attached table for complete list of affected versions), and fixes for these versions are expected by April 14, 2024.  Since CVE-2024-3400 is already under active exploitation, impacted users must apply mitigations immediately to address the risk until security updates are available.

 

Palo Alto advises implementing the following measures:

 

Users with an active 'Threat Prevention' subscription can block attacks by activating 'Threat ID 95187' in their system.

 

Ensure that vulnerability protection is configured on 'GlobalProtect Interfaces' to prevent exploitation. More info on that is available here.

 

Disable device telemetry until fixing patches are applied. Instructions on how to do that can be found on this webpage.

 

The issue is suspected to be very severe, so admins must take prompt action to secure their systems. Vulnerability Management and GCTI are currently assessing impact and working with Incident response to develop a plan to address any devices that may be impacted by this vulnerability.

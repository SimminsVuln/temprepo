	Hello Team,

A Security researchers have recently documented a novel method that threat actors are using to trick victims into clicking into malicious webpages. Through the use of .url shortcut files disguised as .pdf files, the attacker forces a user to open internet explorer due it it's less secure nature over more modern browsers like chrome and edge. Once open, the user may be redirect to malicious content that may result in Arbitrary Code Execution.  The method of attack was verified to have worked on a workstation directing a url shortcut to open internet explorer and navigate to google.com.

CVEID: CVE-2024-38112 Windows MSHTML Platform Spoofing Vulnerability

Product:
Microsoft Internet Explorer

CVSS: 7.5
EPSS: 83.82%%

Is a patch available: Yes

Has the vulnerability been exploited in the wild: Yes
Is POC Code Publicly available: Yes

Description:
An Exposure of Resource to Wrong Sphere vulnerability exists that, when exploited, allows a remote attacker to spoof unspecified content. Successful exploitation of this vulnerability requires an attacker to take additional actions prior to exploitation to prepare the target environment.  An attacker would have to send the victim a malicious file that the victim would have to execute.

Impact: 
An attacker could exploit this vulnerability to execute arbitrary code. The attacker would need to specially craft a malicious document that contains a .url shortcut that opens Microsoft Explorer and directs a user to a malicious site which can result in arbitrary code execution. a PoC code was tested and found that Manulife workstations are impacted by this vulnerability. (See attached screenshot)

Source:
(1) https://research.checkpoint.com/2024/resurrecting-internet-explorer-threat-actors-using-zero-day-tricks-in-internet-shortcut-file-to-lure-victims-cve-2024-38112/
(2) https://msrc.microsoft.com/update-guide/en-US/advisory/CVE-2024-38112

Detection Capability:
Qualys QID (92149): Deployed - Active findings 46.6k
Zero Day/Exploited: Yes![image](https://github.com/SimminsVuln/temprepo/assets/147641659/6cf5672a-348f-45a8-b8c8-bd2f66fe0c69)

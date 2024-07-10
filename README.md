	• Microsoft Patch Tuesday: Zero Days / Publicly Disclosed Vulnerabilities.
		○ 
CVE-2023-24932
			▪ Title: Secure Boot Security Feature Bypass Vulnerability
			▪ CVSS: 6.7
			▪ Description: An attacker could exploit this vulnerability to execute self-signed code at the Unified Extensible Firmware Interface (UEFI) level while Secure Boot is enabled. Exploitation of this vulnerability ultimately allows an attacker to maintain persistence and evade defenses. An attacker would need to create a specially crafted application and run it on a vulnerable system. In January 2022, Microsoft released patches for 
CVE-2022-21894
, also known as baton drop, to address a vulnerability allowing an attacker with local administrator permissions to execute code at the Unified Extensible Firmware Interface (UEFI) level. This vulnerability was known to be exploited by the BlackLotus bootkit. On March 1, 2023, ESET reported that this vulnerability (
CVE-2023-24932
) is a bypass for the 
CVE-2022-21894
 patch, and is also used by the BlackLotus bootkit. ESET observed threat actors leveraging the BlackLotus bootkit after gaining initial access and local administrator privileges, to then escalate privileges to kernel-level permissions. The bootkit leverages the kernel-level permissions to disable OS security mechanisms and install an HTTP downloader responsible for communication with the command and control server and load additional user-mode or kernel-mode payloads.
			
			Microsoft's patch for 
CVE-2023-24932
 is not enabled by default and must be manually applied using Microsoft's configuration guidance. The latest update has enabled the fix by default with the July 2024 update.
			▪ Publicly Disclosed: Yes
			▪ Zero Day/Exploited: Yes
			
		○ 
CVE-2023-38545
			▪ Title: Hackerone: SOCKS5 heap buffer overflow
			▪ CVSS: 9.8
			▪ Description: When curl is asked to pass along the hostname to the SOCKS5 proxy to allow that to resolve the address instead of it getting done by curl itself, the maximum length that hostname can be is 255 bytes. If the hostname is detected to be longer than 255 bytes, curl switches to local name resolving and instead passes on the resolved address only to the proxy. Due to a bug, the local variable that means "let the host resolve the name" could get the wrong value during a slow SOCKS5 handshake, and contrary to the intention, copy the too long hostname to the target buffer instead of copying just the resolved address there. An attacker could exploit this vulnerability to execute arbitrary code. An attacker would need to cause a user to connect to a malicious proxy server, and then reply to a SOCKS5 proxy handshake with a 30x status code redirect to a hostname with a length between 16kB and 64kB. A failed attempt at exploitation could potentially cause a crash of the application, resulting in a denial-of-service condition.
			▪ Publicly Disclosed: Yes
			▪ Zero Day/Exploited: No
			
		○ 
CVE-2024-35264
			▪ Title: .NET and Visual Studio Remote Code Execution Vulnerability
			▪ CVSS: 8.1
			▪ Description: A Use After Free vulnerability exists that, when exploited, allows a remote attacker to execute arbitrary code. An attacker could exploit this by closing an http/3 stream while the request body is being processed leading to a race condition. This could result in remote code execution
			▪ Publicly Disclosed: Yes
			▪ Zero Day/Exploited: No
			
		○ 
CVE-2024-37985
			▪ Title: Arm: Systematic Identification and Characterization of Proprietary Prefetchers
			▪ CVSS: 5.9
			▪ Description: An attacker who successfully exploited this vulnerability could view heap memory from a privileged process running on the server. Successful exploitation of this vulnerability requires an attacker to take additional actions prior to exploitation to prepare the target environment.
			▪ Publicly Disclosed: Yes
			▪ Zero Day/Exploited: No
			
		○ 
CVE-2024-38080
			▪ Title: Windows Hyper-V Elevation of Privilege Vulnerability
			▪ CVSS: 7.8
			▪ Description:  Microsoft Windows Hyper-V contains a An Integer Overflow or Wraparound privilege escalation vulnerability that allows a local attacker with user permissions to gain SYSTEM privileges. No further details have been provided.
			▪ Publicly Disclosed: No
			▪ Zero Day/Exploited: Yes
			
		○ 
CVE-2024-38112
			▪ Title: Windows MSHTML Platform Spoofing Vulnerability
			▪ CVSS: 7.5
			▪ Description: An Exposure of Resource to Wrong Sphere vulnerability exists that, when exploited, allows a remote attacker to spoof unspecified content. Successful exploitation of this vulnerability requires an attacker to take additional actions prior to exploitation to prepare the target environment.  An attacker would have to send the victim a malicious file that the victim would have to execute.
			▪ Publicly Disclosed: No
Zero Day/Exploited: Yes![image](https://github.com/SimminsVuln/temprepo/assets/147641659/6cf5672a-348f-45a8-b8c8-bd2f66fe0c69)

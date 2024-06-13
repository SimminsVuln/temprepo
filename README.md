	• 
CVE-2024-30103
: Microsoft Outlook Remote Code Execution Vulnerability
		· Released as part of June 2024 Patch Tuesday
		· MS Claims no exploitation in the wild or POC code.
			▪ They anticipate Exploitation is less likely but we will continue to monitor in the event of POC Code and Exploitation.
		· Description:
			▪ Vector: Preview Pane
			▪ Exploitation Consequence: An attacker who successfully exploited this vulnerability could bypass Outlook registry block lists and enable the creation of malicious DLL files.
		· Need to discuss accelerating this vulnerability due to the outlook.
		
	• 
CVE-2024-30080
: Microsoft MSMQ Remote Code Execution Vulnerability
		· Released as part of June 2024 Patch Tuesday
		· MS Claims no exploitation in the wild or POC code.
			▪ They anticipate Exploitation is More likely so we will continue to monitor in the event of POC Code and Exploitation.
		· Description:
			▪ To exploit this vulnerability, an attacker would need to send a specially crafted malicious MSMQ packet to a MSMQ server. This could result in remote code execution on the server side.
		· Mitigations:
			▪ If users are unable to patch MS recommends the following mitigation:
				The Windows message queuing service, which is a Windows component, needs to be enabled for a system to be exploitable by this vulnerability. 
				
				This feature can be added via the Control Panel.
				
				You can check to see if there is a service running named Message Queuing and TCP port 1801 is listening on the machine.


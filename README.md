Paragon Partition Manager's BioNTdrv.sys driver, in versions prior to 2.0.0, contains five vulnerabilities, including arbitrary kernel memory mapping and write flaws, a null pointer dereference, insecure kernel resource access, and an arbitrary memory move vulnerability. ​


Attackers with local access can exploit these vulnerabilities to escalate privileges to SYSTEM level or cause a denial-of-service (DoS) scenario. Notably, even if Paragon Partition Manager is not installed, attackers can utilize a Bring Your Own Vulnerable Driver (BYOVD) technique to exploit systems using the vulnerable driver. ​
kb.cert.org

Microsoft has observed threat actors leveraging these vulnerabilities, particularly CVE-2025-0289, in ransomware attacks to achieve privilege escalation before executing further malicious code. ​

Paragon Software has addressed these issues by releasing BioNTdrv.sys version 2.0.0. Additionally, Microsoft's Vulnerable Driver Blocklist has been updated to block the affected driver versions. Users are advised to update to the latest version and ensure the blocklist is active to mitigate potential exploitation. ​


Reworded Summary of the Provided Statement:

Currently, this vulnerability does not affect our environment.​
There is no indication that Paragon Partition Manager is utilized in our systems, including Axonius, ServiceNow (SNOW), Qualys, or IT support documentation.​
We will continue to monitor for any detections or changes related to this vulnerability before considering its removal from our watchlist.

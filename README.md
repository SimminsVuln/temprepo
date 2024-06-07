
A vulnerability exists within the Netlogon component in Windows Server 2019 which may mishandle secure connections to domain controllers via the Netlogon Remote Protocol (MS-NRPC). The error lies in the ComputeNetlogonCredential functions implementation of the AES-CFB8 cryptographic cipher, which results in predictable ciphertext when keys are reused over an average of 256 applications.

Analysis
An attacker could exploit this vulnerability to gain access to administrator privileges. This vulnerability needs to be exploited from a system with access to the Domain Controller. The most likely attack vector would be an attacker who has first gained access to the same local network segment or through an already compromised system. 


Samba recommends the following to completely mitigate the possibility of exploitation:

 

Users of versions of Samba before 4.8 should set server schannel = yes in their smb.conf and restart Samba on all domain controllers.

 

Users of versions 4.8 and above should ensure their smb.conf either,

a. has the "server schannel = yes" line, or
b. has no "server schannel" line.

 

If in doubt, add "server schannel = yes" to smb.conf.

 

 

IBM recommends the follow steps executed as root user on both the ha1 and ha2 hosts to completely mitigate the possibility of exploitation on PureData System for Analytics N200x and N3001 systems:

Check if Samba module is installed in the host `rpm -qa | grep samba`
Check if Samba service is running `/etc/init.d/smbstatus`
If Samba service is running, stop the smb service `/etc/init.d/smb stop`
Backup the /etc/samba/smb.conf file `cp /etc/samba/smb.conf /etc/samba/smb.conf_backup`
Edit the /etc/samba/smb.conf and set `server schannel = yes` parameter in global settings
Start the smb services `/etc/init.d/smb start`
 

Handling Non-compliant Devices

 

Microsoft has provided techniques to find non-compliant devices. As of Aug. 11, 2020, events in the DC event log can help you find non-compliant devices by searching for event ID 5829. Microsoft has provided a script that can assist in identifying these devices. If a DC is noncompliant and therefore cannot support secure RPC, they should be added to the "Domain controller: Allow vulnerable Netlogon secure channel connections" group policy. These devices should be heavily monitored with additional security controls in place until an update is provided or they can be retired.

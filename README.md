Putty, Popular Terminal Application Used for Remote Connections, Announce Critical Vulnerability:
 
Putty, a widely used open-source terminal program that often transfers files over SSH, has disclosed a critical vulnerability that can expose a user's NIST P-521 secret key. The vulnerability, CVE-2024-31497, affects ECDSA (Elliptic Curve Digital Signature Algorithm) nonce generation allowing an attacker to recover a user's NIST P-521 secret key via a quick attack. This attack can obtain the key in a short time, usually less than 60 signatures. This is particularly relevant in a situation where an adversary can see messages signed by PuTTY or Pageant.
As of the time of writing there has been no indication that this vulnerability has been exploited in the wild, nor is there POC code available for it.
An attacker who has a few dozen signed messages and the public key can get the private key, and then make signatures that look like they came from the user, letting them (for example) access any servers you use that key for. However, in order to obtain the signatures, the attacker will have to compromise the server for which the key is used to authenticate to.
One way that an attacker can harm the victim is by running an SSH server that the victim logs into (for remote access or file transfer), even though the victim does not fully trust this server, and the victim uses the same private key for SSH connections to other services run by different parties. In this case, the dishonest server operator (who would normally have no chance to find out the victim's private key) can figure out the victim's private key, and then use it for unauthorized access to those other services.
Another consideration is that since SSH can be used to log in to Git services, this vulnerability might enable supply-chain attacks on software that is stored in Git.
Besides impacting PuTTY, it also affects other products that incorporate a vulnerable version of the software –
FileZilla (3.24.1 - 3.66.5)  - A patch is available
WinSCP (5.9.5 - 6.3.2)  - A patch is available
TortoiseGit (2.4.0.2 - 2.15.0)  - A patch is available
TortoiseSVN (1.10.0 - 1.14.6) - No patch available, Users of TortoiseSVN should use Plink from the newest PuTTY 0.81 release to access an SVN repository through SSH until a patch is available. 
 
Impact:
Software - Assets Impacted - Detection Capability
PuTTy (0.68 - 0.80) - 7804 - QID in Pipeline
FileZilla (3.24.1 - 3.66.5) - 368 - QID in Pipeline
WinSCP (5.9.5 - 6.3.2) - 5679 - QID in Pipeline
TortoiseGit (2.4.0.2 - 2.15.0) - 1302 - No Detection Capability
TortoiseSVN (1.10.0 - 1.14.6) - 1532 - No Detection Capability

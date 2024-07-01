CVE-2024-6387: regreSSHion SSH RACE Vulnerability

CVSS: 8.1
Exploited in the Wild: Unknown
PoC Code Publicly Available: Available, but unverified

Description: If a client does not authenticate within LoginGraceTime seconds (120 by default, 600 in old OpenSSH versions), then sshd's SIGALRM handler is called asynchronously, but this signal handler calls various functions that are not async-signal-safe (for example, syslog()). This race condition affects sshd in its default configuration.

Impact: This race condition affects sshd in its default configuration. An attacker could exploit this vulnerability to execute arbitrary code with elevated permissions. An attacker would need to win a race condition by performing many malformed SSH authentication attempts. Failed attempts to exploit this vulnerability could potentially cause a denial-of-service condition.

Detection: Qualys recommends using Attack Surface Management to detect vulnerable assets that are externally facing. A QID has been released for this vulnerability under QID:42046. 

Sources: 
(1) https://
ubuntu.com
/security/
CVE-2024-6387
(2) 
https://www.qualys.com/regresshion-cve-2024-6387/
Product
Version
Canonical	Ubuntu Linux	24.04
Canonical	Ubuntu Linux	22.04 Lts
FreeBSD	FreeBSD	14.1
FreeBSD	FreeBSD	13.3
FreeBSD	FreeBSD	14.0
OpenBSD	OpenSSH	8.5p1 through prior to 9.8p1
OpenBSD	OpenSSH	8.5p1 through 9.7p1
Canonical	Ubuntu Linux	23.10
Oracle	Linux	9
OpenBSD	OpenSSH	prior to 4.4 P1

https://seclists.org/oss-sec/2024/q3/2

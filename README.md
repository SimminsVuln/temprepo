Description
OSS-Sec Mailing List has provided the following description: If a client does not authenticate within LoginGraceTime seconds (120 by default, 600 in old OpenSSH versions), then sshd's SIGALRM handler is called asynchronously, but this signal handler calls various functions that are not async-signal-safe (for example, syslog()). This race condition affects sshd in its default configuration.

Analysis
An attacker could exploit this vulnerability to execute arbitrary code with elevated permissions. An attacker would need to win a race condition by performing a large number of malformed SSH authentication attempts. Failed attempts to exploit this vulnerability could potentially cause a denial-of-service condition.


CVSS v3.1 Base
8.1 (High)


If sshd cannot be updated or recompiled, this signal handler race condition can be fixed by simply setting LoginGraceTime to 0 in the configuration file. This makes sshd vulnerable to a denial of service (the exhaustion of all MaxStartups connections), but it makes it safe from the remote code execution presented in this advisory.

Vendor
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

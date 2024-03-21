Loop DoS attack may impact hundreds of thousands of systems: Here’s what you need to know.

 

A new way of causing denial-of-service (DoS) attacks has been discovered that affects application-layer protocols that use User Datagram Protocol (UDP), potentially exposing hundreds of thousands of hosts to harm. The method, called Loop DoS attacks, involves linking servers of several protocols in a way that makes them keep talking to each other without end. UDP is inherently a connectionless protocol that does not check source IP addresses, making it easy to fake them. Therefore, when attackers create several UDP packets with a victim IP address, the target server replies to the victim (instead of the attacker), resulting in a reflected denial-of-service (DoS) attack.

 

The newest research showed that some ways of using the UDP protocol, such as DNS, NTP, TFTP, Active Users, Daytime, Echo, Chargen, QOTD, and Time, can be exploited to create a self-sustaining attack loop. The attack connects two network services in such a way that they keep sending messages to each other endlessly, creating a lot of traffic that leads to a denial-of-service for the systems or networks involved. Once the loop is started by a trigger from the attackers, even they cannot stop the attack.

 

CISPA, the group of researchers who originally identified this weakness, says that 300,000 hosts and their networks are vulnerable to Loop DoS attacks. The researchers said that there is no proof that the attack has been used for malicious purposes yet, but the exploitation is easy. They also list several products that they have identified as being potentially vulnerable.

 

Software affected.

This list is not complete, and they invite any software developers to contact them if they think their software might be exposed to this attack.

 

TFTP:

atftpd not affected (uses random source port for responses)

tftpd not affected (uses random source port for responses)

 

NTP:

ntpd before version 4.2.4p8 and version 4.2.5 (CVE-2009-3563)

 

DNS:

dproxy-nexgen

 

Legacy protocols:

At least the QOTD, Chargen, Echo, Time, Daytime and Active Users protocols are affected. These protocols were historically implemented as part of inetd in Linux and can be disabled in inetd.conf.

 

Vulnerabilities 

Currently, these vulnerabilities are labeled as CVE-2009-3563, CVE-2024-1309, and CVE-2024-2169. Below are some vendors that researchers suspect might be affected. The researchers are still in contact with several vendors to verify if more products are involved.

 

Sources:

CISPA Advisory on Application-Layer Loop DoS - Google Docs

VU#417980 - Implementations of UDP-based application protocols are vulnerable to network loops (cert.org)

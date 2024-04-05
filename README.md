Newly discovered HTTP/2 vulnerabilities called “CONTINUATION Flood” can lead to DDoS attack that crash web servers with just a single TCP connection. 
HTTP/2 uses binary framing for data transmission; its messages include header and trailer sections serialized into blocks. The “HEADERS” frame allows HTTP headers to be sent for both requests and responses. It has a maximum size which, if exceeded, the transmission will disconnect. In this case, senders use the CONTINUATION frames to inform recipients that they are delivering more header blocks. The sender sets an “end flag” after the transmission is completed. 
The CONTINUATION Flood vulnerabilities occur when HTTP/2 implementations are not properly check, such as without Header size limit or request timeouts, and the attacker deliberately sends an extremely long string of frames without setting an end flag. It creates an infinite stream of headers and CONTINUATION frames that the HTTP/2 server would need to parse and store in memory. The abuse leads to different level of DDoS attacks, like memory leak, memory consumption and CPU exhaustion. Following vulnerabilities are associated with the CONTINUATION Flood and notified Indication & Warning Team for review:
•	CVE-2024-27983
•	CVE-2024-27919
•	CVE-2024-2758
•	CVE-2024-2653
•	CVE-2023-45288
•	CVE-2024-28182
•	CVE-2024-27316
•	CVE-2024-31309
•	CVE-2024-30255

FYSA: HTTP/2 Vulnerabilities - Mandiant Rates all of these as Low Risk currently. Limited data available for scoring or detection. 



CVE-2024-27983: Affects Node.js HTTP/2 server. Sending a few HTTP/2 frames can cause a memory leak due to a race condition, leading to a potential DoS.
CVSS: TBD
QID: None
Source: https://www.arista.com/en/support/advisories-notices/security-advisory/19221-security-advisory-0094



CVE-2024-27919: Affects Envoy's oghttp codec. Unlimited memory consumption due to not resetting a request when header map limits are exceeded.
CVSS: 7.5
QID: 44179 (Dev)
Source: https://www.arista.com/en/support/advisories-notices/security-advisory/19221-security-advisory-0094



CVE-2024-2758: Relates to Tempesta FW. Its rate limits are not effectively preventing empty CONTINUATION frames attacks, potentially allowing DoS.
CVSS: TBD
QID: None 
Source: https://www.arista.com/en/support/advisories-notices/security-advisory/19221-security-advisory-0094



CVE-2024-2653: Affects amphp/http. It collects CONTINUATION frames in an unbounded buffer, risking an OOM crash if the header size limit is exceeded.
CVSS: TBD
QID:997936
Source: https://www.arista.com/en/support/advisories-notices/security-advisory/19221-security-advisory-0094



CVE-2023-45288: Affects Go's net/http and net/http2 packages. Allows an attacker to send an arbitrarily large set of headers, causing excessive CPU consumption.
CVSS: TBD
QID: None
Source: https://www.arista.com/en/support/advisories-notices/security-advisory/19221-security-advisory-0094



CVE-2024-28182: Involves an implementation using nghttp2 library, which continues to receive CONTINUATION frames, leading to a DoS without proper stream reset callback.
CVSS: 5.3
QID: None
Source: https://www.arista.com/en/support/advisories-notices/security-advisory/19221-security-advisory-0094



CVE-2024-27316: Affects Apache Httpd. Continuous stream of CONTINUATION frames without the END_HEADERS flag set can be sent, improperly terminating requests.
CVSS: TBD
QID: None
Source: https://www.arista.com/en/support/advisories-notices/security-advisory/19221-security-advisory-0094



CVE-2024-31309: Affects Apache Traffic Server. HTTP/2 CONTINUATION DoS attack can cause excessive resource consumption on the server.
CVSS: 7.5
QID: None
Source: https://www.arista.com/en/support/advisories-notices/security-advisory/19221-security-advisory-0094



CVE-2024-30255: Affects Envoy versions 1.29.2 or earlier. Vulnerable to CPU exhaustion due to a flood of CONTINUATION frames, consuming significant server resources.
CVSS: 5.3
QID: None
Source: https://www.arista.com/en/support/advisories-notices/security-advisory/19221-security-advisory-0094

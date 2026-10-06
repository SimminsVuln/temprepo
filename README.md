Ping officially opened an incident at 16:29 UTC / 9:29 AM PT, initially reporting PingOne problems "in all geographies." At 16:50 UTC, Ping said it had identified the cause and was implementing a fix. Their current wording says PingOne and PingID are affected in all geographies except Australia. Ping Identity Status
The scope is unusually broad. Ping's status page currently marks major outages across services including:
- PingOne user login/login APIs
- PingOne MFA
- PingID
- DaVinci runtime/administration
- PingOne Protect, Verify, Credentials and Authorize
- Administration consoles
- LDAP Gateway
- PingOne for Enterprise SSO
- US, Canada, Europe and Singapore
Australia is conspicuously operational. Ping Identity Status
There is also corroborating community reporting. Administrators are reporting enterprise-wide authentication failures, inability to access Ping support, and support emails reportedly bouncing. One r/sysadmin thread describes PingID as broadly unavailable, while another describes corporate access as effectively down. Reddit
What's causing Ping?
Ping has identified the cause internally but has not disclosed it publicly yet. Their incident update literally stops at "identified the cause" and "implementing a fix." Ping Identity Status
There is an interesting AWS connection: Ping's own documentation says its PingID service installations are hosted in Amazon's cloud, and Ping's current subprocessor documentation lists AWS as infrastructure for PingID. Ping Identity Docs
However, I would currently assess a general AWS failure as an unlikely explanation.
The strongest reason is the geographic pattern. If a broad AWS service or AWS networking layer were failing badly enough to simultaneously take out Ping across the US, Canada, Europe and Singapore, I'd expect considerable collateral impact among unrelated AWS customers. I am not seeing that. More importantly, Ping's Australian environment is also Amazon-hosted and remains operational, which weakens the hypothesis of a generic AWS infrastructure outage. Ping Identity Docs
AWS — reports exist, but they don't look widespread
AWS's official health dashboard currently shows its long-running disruptions in UAE (me-central-1) and Bahrain (me-south-1), stemming from physical infrastructure damage earlier this year. It does not currently show a new US, European or global AWS incident corresponding to today's Ping outage. AWS Health
StatusGator is receiving some AWS user reports today—roughly a dozen over the past 24 hours—but describes the confirmed AWS impairment as the existing Middle East regional problem. Reports such as Bedrock/Kiro errors exist, but that's nowhere near the signal I'd expect from a broad AWS failure. StatusGator
There are even third-party AWS customers whose current status pages explicitly show AWS components in US regions as operational today. Coda Status

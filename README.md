Current Condition:
A critical vulnerability (CVE-2025-32433) has been identified in the Erlang/OTP SSH implementation, which can lead to unauthenticated remote code execution.

The issue arises from improper message handling before authentication, allowing an attacker to execute arbitrary code within the SSH daemon.

If the SSH daemon runs with elevated privileges (e.g., root), successful exploitation may result in full system compromise.

Affected environments may include IoT, OT, telecom, and distributed systems leveraging Erlang/OTP-based services.

Actions (for Vuln Intel team):
Determine exposure:

Query asset management systems for applications or systems that use Erlang/OTP or embed it as part of a stack (e.g., RabbitMQ, CouchDB, certain telco systems).

Request feedback from system owners or application teams:

Send out a standardized information request asking:

Are any in-house or vendor-managed services using Erlang/OTP SSH?

What versions are currently deployed?

Are SSH services exposed externally or restricted internally?

Add to the watchlist:

Flag this CVE for tracking, especially across high-availability or production systems where downtime may be critical.

Coordinate with vendor management teams:

If impacted products are vendor-managed (e.g., embedded systems or SaaS platforms), initiate outreach to vendors for patch guidance and exposure status.

Monitor detection coverage:

Check with detection teams to verify if any relevant Qualys QIDs, Tenable plugins, or Sigma rules are available.

Document current intelligence:

Record affected versions (pre-27.3.3, pre-26.2.5.11, pre-25.3.2.20) and any observed trends regarding exploitation or proof-of-concept availability.

Tag for re-review:

Schedule this vulnerability for re-evaluation in 7–10 days based on vendor responses or detection rule availability.

CrackArmor AppArmor Local Privilege Escalation Vulnerabilities
Summary

Researchers from the Qualys Threat Research Unit disclosed a group of nine vulnerabilities in the Linux AppArmor security module, collectively referred to as “CrackArmor.” These vulnerabilities arise from logic and permission handling flaws within AppArmor’s mediation mechanisms, allowing a local attacker to manipulate policy enforcement and bypass AppArmor protections.

Successful exploitation allows a local unprivileged user to escalate privileges to root, bypass Mandatory Access Control restrictions, and potentially escape container environments where AppArmor is used for isolation (e.g., Docker or Kubernetes). These flaws have reportedly existed since Linux kernel 4.11 (2017) and affect distributions where AppArmor is enabled by default, including Ubuntu, Debian, and SUSE Linux.

Proof-of-concept (PoC) exploit techniques published by Qualys demonstrate how attackers can abuse interactions between AppArmor, user namespaces, and privileged utilities to escalate privileges. In addition to root access, the vulnerabilities may enable container isolation bypass, denial-of-service conditions, and information disclosure (such as KASLR bypass through memory reads).

No widespread exploitation has been publicly reported at the time of disclosure; however, due to the availability of PoC techniques and the ubiquity of AppArmor, organizations should treat these vulnerabilities as high risk for privilege escalation on affected Linux systems.

Vulnerability Details

MVE (Most Vulnerable Entity):
Linux systems running AppArmor-enabled kernels, particularly:

Ubuntu Linux

Debian Linux

SUSE Linux Enterprise / OpenSUSE

Systems using AppArmor for container confinement (Docker/Kubernetes)

CVSS:
Approximately 7.8 (High) – Local Privilege Escalation
Vector typically resembles:
CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H

Exploited:
No confirmed exploitation in the wild at the time of disclosure.

Proof of Concept (PoC):
Yes – researcher-developed PoC techniques have been published by Qualys researchers, demonstrating local privilege escalation to root.

Recommended Mitigations
1. Apply Kernel Security Updates

Apply the latest Linux kernel patches provided by your distribution vendor, which include fixes to the AppArmor logic flaws.

2. Update Related Privileged Utilities

Update system packages that may be used in exploit chains, including:

sudo

util-linux (su)

Other privileged binaries interacting with AppArmor profiles.

3. Reboot Systems After Updates

Because remediation occurs at the kernel level, systems must be rebooted after patching to ensure fixes are applied.

4. Restrict Local Access

Since exploitation requires local system access, enforce:

Least privilege access controls

Restricted shell access

Multi-factor authentication for administrative accounts.

5. Monitor for Privilege Escalation Indicators

Monitor for:

Unexpected AppArmor profile changes

Suspicious use of user namespaces

Unusual execution of privileged utilities.

6. Prioritize Container Hosts

Systems hosting containers or multi-tenant workloads should be prioritized for patching due to container escape risk.

7. Validate with Vulnerability Scanning

Use vulnerability management tools (Qualys, Tenable, Rapid7, etc.) to identify vulnerable kernel versions and AppArmor configurations across your Linux infrastructure.

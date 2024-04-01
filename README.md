Red Hat issued a warning on March 29th for users to immediately cease using Fedora 41 or Fedora Rawhide instances for any work or personal activities due to the discovery of a backdoor in the XZ Utils data compression tools and libraries versions 5.6.0 and 5.6.1. Red Hat describes XZ Utils as a widely used data compression format, found in both community and commercial Linux distributions. Its primary function is to reduce large files to a more manageable size for easier sharing through file transfers.
Identified as CVE-2024-3094, this vulnerability could enable an attacker to bypass SSH authentication and gain access to the compromised system. This is because vulnerable versions of XZ Utils libraries contain a hidden malicious injection that is only present in the full download package. The Git distribution does not have the M4 macro that triggers the build of the malicious code. However, if the malicious M4 macro is present, second-stage artifacts in the Git repository are injected during build time. This results in a malicious build that interferes with sshd authentication via systemd, a commonly used protocol for remote system access. Under certain conditions, this interference could allow a malicious actor to bypass sshd authentication and gain unauthorized remote access to the entire system.
Red Hat stated that no versions of Red Hat Enterprise Linux (RHEL) are impacted. However, there are reports and evidence of successful injections in xz 5.6.x versions built for Debian unstable (Sid), and other distributions may also be vulnerable.
Although Red Hat's statement that no versions of its Enterprise Linux are affected is reassuring, the discovery of this backdoor raises serious concerns about a coordinated effort to introduce a vulnerability into widely used Linux distributions. Flashpoint's analysis noted that: 
“ArsTechnica linked the malicious commits to a user known as JiaT75, who has been contributing to the xz Utils project for over two years. It is not yet clear whether this account was compromised or if this is part of a larger, coordinated attack. 
Due to JiaT75's significant involvement in the xz Utils project and potentially others, there is an ongoing effort to review all previous contributions to identify any additional malicious activity.”
A Linux administrator can use a brief shell script, shared by a cybersecurity researcher named Kostas, to determine the installed version of XZ.
for xz_p in $(type -a xz | awk '{print $NF}' | uniq); do strings "$xz_p" | grep "xz (XZ Utils)" || echo "No match found for $xz_p"; done
The script executes the 'strings' command on all xz executables, displaying their embedded versions. This enables the identification of the version without the need to run the potentially compromised executable. Administrators are advised to immediately downgrade to older versions if they are using versions 5.6.0 or 5.6.1. 
GCTI is currently working with Vulnerability Management to assess the potential impact of this vulnerability on our systems. Our preliminary evaluation indicates that we do not use the affected versions mentioned in the alert. We will remain vigilant and provide updates as more information becomes available.
Additional Resources:
RedHat Advisory: https://access.redhat.com/security/cve/CVE-2024-3094

RedHat Security Alert: Urgent security alert for Fedora 41 and Fedora Rawhide users (redhat.com)

ArsTechnica report: https://arstechnica.com/security/2024/03/backdoor-found-in-widely-used-linux-utility-breaks-encrypted-ssh-connections/

CISA Advisory: https://www.cisa.gov/news-events/alerts/2024/03/29/reported-supply-chain-compromise-affecting-xz-utils-data-compression-library-cve-2024-3094


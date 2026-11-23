1. PRISTINE SPIDER Deploys MisakaNetwork Python Variant in Vishing Campaigns
Source: CrowdStrike
Priority: Regular Action

Since mid-October, PRISTINE SPIDER callers have posed as the victim's IT support staff and talked victims into starting a Microsoft Quick Assist screen-sharing session, or in one case installing the remote-access tool HopToDesk. The caller then sent victims to fake login sites to enter their domain credentials and had them download an MSI installer, hosted on Microsoft Azure domains and named like a Windows update. The installer downloads a portable copy of Node.js or Python with curl and runs a new Python version of the MisakaNetwork malware. Unlike earlier versions, it doesn't need Node.js and finds its command server by reading an Ethereum smart contract. To start again at each logon, the Python version drops MicrosoftEdgeUpdate.cmd into the user's Startup folder, or a hidden .vbs version if it detects SentinelOne. The Node.js version uses a scheduled task instead. The installer's batch script also hides its encoded PowerShell commands in environment variables, so they don't show up on the command line.

Action:

In addition to the IOCs, and Falcon LogScale Queries for the Threat Hunt team, this report includes the following recommendations for stakeholders to review:
- Detection Engineering: Alert when an msiexec installation causes curl to download a portable Python or Node.js package (e.g., python-3.11.7-embed-amd64.zip). Also alert on PowerShell decoding Base64 read from an environment variable ($env:... passed to FromBase64String).
- Detection Engineering/Threat Hunting: Hunt/Alert on MicrosoftEdgeUpdate.cmd or .vbs files, or any other .cmd or .vbs file, written to the user Startup folder. Real Edge updates don't use the Startup folder.
- Security Engineering: Block access to public Ethereum RPC services from workstations, since no normal business use needs it. This cuts off how MisakaNetwork finds its command server.

2. Unknown Actor Compromises Optimizely CDN, Conducts Cryptocurrency Theft, Delivers iOS Exploit Kits DarkSword and GhostWave
Source: CrowdStrike
Priority: Regular Action

On 16 November, an attacker added malicious code to the "Project JavaScript" field of Optimizely Web customer projects. That field holds custom code each customer writes for its own site, so every visitor to an affected site received the attacker's code from Optimizely's trusted CDN, without the customers' own websites being breached. Report URI found 188 infected snippets across 178 organizations, including 32 in banking and finance, and insurers such as Mutual of Omaha and Securian. The injected script, track.js, swapped cryptocurrency wallet addresses on the page and in the clipboard, skimmed card numbers typed into the site's own forms, and stole cookies that scripts can read along with screenshots of the page. On iPhones and iPads, it checked the iOS version and loaded the DarkSword or GhostWave exploit kit in a hidden frame. Report URI notes the attacker hid the loader in base64 and included a full inline copy that runs through eval, so it still worked on sites whose Content Security Policy (CSP) blocked the attacker's domain. That is how it ran on HSBC's site.

Action:

In addition to the IOCs, Falcon LogScale Queries, and YARA Rules for the Threat Hunt team, this report includes the following recommendations for stakeholders to review:
- Security Engineering: List every third-party script platform on our public and customer-facing sites that lets someone add custom JavaScript, such as A/B testing, tag managers, and analytics. Check who and what has write access to those fields (users, API tokens, integrations), and treat changes to them as production code changes that need approval.
- Security Engineering: Review the CSP on customer-facing sites. Limit script-src and connect-src to the specific hosts each site needs, and remove 'unsafe-eval' and 'strict-dynamic' where you can. Allowing the vendor's CDN didn't help here because the malicious code came from that CDN.
- Threat Hunting: Check proxy, DNS, and mobile device management logs for corporate iPhones and iPads that contacted the attacker's infrastructure on 16–17 November. If any are found, look for boot.js, pe_main.js, or frame.html in Safari history and cache.

3. eCrime Actor n0n Abuses AWS IAM Role Trust Relationships to Access and Extort Cloud Data Platform Provider Customers
Source: CrowdStrike
Priority: Regular Action

From 14 to 25 October, the eCrime actor n0n likely conducted data theft and extortion intrusions against customers of a cloud data platform provider by abusing the AWS Identity and Access Management (IAM) role customers had granted to the vendor's account. The actor issued AssumeRole calls to enter customer AWS environments, enumerated resources, retrieved secrets, and exfiltrated Amazon S3 data before emailing victims extortion demands and directing them to its leak site. Since September, n0n has named more than 180 victims and allegedly leaked their data as countdown timers expire. On 11 November, n0n publicly claimed responsibility for this campaign and announced the recruitment of new affiliates. The activity shows how compromising a vendor-side account can expose downstream access to an entire customer base.

Action:
- Threat Hunting: Review the report's IOCs and hunt for suspicious AWS access originating from the vendor's account (805246085872) or session names beginning with guiam-.
- Security Engineering: Review third-party access to AWS accounts, remove what is unused, and limit the rest to least privilege.
- Incident Response: If the affected vendor is used, review its access, rotate exposed secrets, and revoke active sessions. Prepare for extortion scenarios.

4. Trigram Campaign Targets AI, Blockchain, and Logistics Developers with Fake Job Offers and an Infostealer
Source: Stormshield
Priority: Regular Action

A large-scale North Korea-linked campaign dubbed "Trigram" impersonates about 50 AI, blockchain, and logistics brands to trick developers into infecting themselves with an infostealer. Attackers sent emails offering well-paid remote developer roles, conference invitations, or package-tracking notices that link to convincing decoy websites. They launched a fake application process and an anti-spam verification step to instruct the user to run a command in a terminal, subsequently downloading a script that targets Windows, macOS, or Linux. The script installs a portable Node.js runtime if needed, retrieves a next-stage payload, and locates its C2 server through a public GitLab repository used as a dead drop. The payload deploys the OverLord infostealer, which targets browser credentials, cryptocurrency wallets, and other sensitive files. The operators also run a back-office platform that scrapes developer profiles, sends mass email through multiple providers, and tracks victims in real time, allowing them to swap decoys and C2 infrastructure quickly. Researchers assess with high confidence that the activity continues the JUNK_DeadDrop cluster and links to Kimsuky (APT-43).

Action:
- Threat Hunting: Review the observables, indicators, and infrastructure details included in the source report. Hunt on developer workstations for terminal commands that download verify.sh or verify_m scripts, unexpected portable Node.js runtimes, and connections to public GitLab repositories from scripts or Node.js processes.
- Detection Engineering: Build detections for terminal commands pasted immediately after a browser session that chain curl or PowerShell downloads with Base64 decoding, and for VS Code or Cursor automatic task configuration files created in unusual directories.
- Security Engineering: Restrict developers from running build commands (e.g., npm run build) on repositories received through recruiters or coding assessments outside of an isolated environment, and review installed editor extensions. Monitor new domain registrations that combine company brand names with recruitment keywords.
- Incident Response: If a developer ran a command from a recruitment or conference site, isolate the host, rotate browser-stored credentials, SSH keys, .env secrets, and cryptocurrency wallet credentials, and review terminal and browser history to identify the original lure.

Table-Top Procedure Document for Vulnerability Intel
Zero Day Vulnerability Exploit Scenario
Introduction
This document outlines the detailed procedure to be followed by the vulnerability intel team during a simulated zero-day vulnerability being exploited in the wild. The procedure includes the use of specific tools and the involvement of relevant stakeholders to ensure a coordinated and effective response.
Tools
•	Axonius and Bitsight: Asset Identification and External Identification
•	Qualys: Vulnerability Detection
•	ServiceNow: Incident Response
•	Mandiant: External Asset Identification
•	Veracode: Application Security Testing
Procedure
Stage 1: Detection
1. Initial Alert: Receive initial alert about the zero-day vulnerability being exploited in the wild.
2. Vendor Communication:
•	Contact vendors to determine the severity of the vulnerability and obtain any available patches or workarounds.
3. Asset Identification with Axonius and Bitsight:
•	Use Axonius and Bitsight to identify all assets that may be affected by the zero-day vulnerability.
•	Generate a comprehensive list of potentially impacted assets and share it with relevant teams.
4. Vulnerability Detection with Qualys:
•	Run a Qualys scan to detect the presence of the zero-day vulnerability on identified assets.
•	Document and prioritize the vulnerabilities based on their criticality and potential impact.
•	Provide detailed reports to the incident response team for further action.
5. External Asset Identification with Mandiant:
•	Use Mandiant to identify any external assets that may be compromised.
6. Obtain Indicators of Compromise (IoCs) and Signatures:
•	Collect IoCs and signatures to help identify actors involved in the exploitation process.
7. Application Security Testing with Veracode:
•	Use Veracode to conduct security testing on critical applications to identify any vulnerabilities that require immediate remediation.
Note: Identification through manual searches and Qualys scans, as well as continuous patching, must be ongoing during the entire event.
Stage 2: Incident Response
8. Incident Creation in ServiceNow:
•	Create a new incident in ServiceNow for tracking and response coordination.
•	Ensure all relevant information, including affected assets and detected vulnerabilities, is logged accurately.
9. Stakeholder Involvement:
•	Notify the Legal team to assess potential legal implications and compliance requirements.
•	Legal Team to draft statements to third parties and partners, and handle communication with them for continuous monitoring and updates.
•	Engage the Patching Groups and Technology Owners to plan and execute the remediation process.
•	Involve the Incident Response Teams to manage and mitigate the vulnerability exploitation effectively.
10. Hunt Team Monitoring:
•	Hunt team to actively monitor for any exploitation attempts and provide real-time updates.
Stage 3: Remediation
11. Patch Deployment:
•	Deploy patches to remediate the zero-day vulnerability on all identified external assets.
•	Coordinate with patching groups to ensure timely and efficient patch deployment.
•	Technology owners to verify the compatibility and effectiveness of the patches.
12. Confirmation and Verification:
•	Confirm with third parties that patches have been applied successfully.
•	Verify remediation status on all external assets through subsequent scans and monitoring.
•	Document the outcomes and share them with all relevant stakeholders.
Stage 4: Completion
13. Incident Closure:
•	Update the incident in ServiceNow to reflect the remediation status and close the incident.
•	Conduct a post-incident review to identify lessons learned and improve future response processes.
Swim Lanes for Stakeholders
Stakeholder	Role	Responsibilities
Vulnerability Intel and IT Team	Primary	Assist with asset identification, vulnerability scanning, patch deployment, and response coordination.
Security Operations Center (SOC)	Support	Monitor for suspicious activities and provide security insights.
Legal Team	Advisory	Assess legal implications, ensure compliance, and handle communication with third parties. <b>Draft statements to third parties and partners.</b>
Patching Groups	Operational	Deploy patches and ensure all systems are updated effectively.
Technology Owners	Operational	Verify compatibility and effectiveness of patches on their respective systems.
Incident Response Teams	Operational	Manage and mitigate the exploitation of the vulnerability.
Hunt Team	Operational	Monitor for any exploitation attempts and provide real-time updates.
Third Parties	External	Apply patches to their systems and provide remediation confirmation.
Affected Vendors	External	Communicate the severity of the vulnerability and provide patches or workarounds.
Conclusion
Once the vulnerability has been remediated on all external assets and confirmation has been received from third parties, the procedure concludes. The next steps involve monitoring internal assets to ensure that the patching process is fully completed and no internal systems remain vulnerable.


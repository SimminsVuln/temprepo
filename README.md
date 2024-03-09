Procedure Document for Vulnerability Intelligence
Steps to identify, assess, and track vulnerabilities related to our tech stack

Step 1: Check Flexera for security advisories
•	Log in to Flexera and navigate to the Security Dashboard.
•	Filter the dashboard by the technologies and products that are relevant to our tech stack.
•	Review the security advisories that are displayed and note down the CVE IDs, severity scores, and affected versions.

Step 2: Check Feedly for trending news on emerging vulnerabilities
•	Log in to Feedly and subscribe to the feeds of reputable sources of vulnerability information, such as NIST, CERT, SANS, etc.
•	Scan the headlines and summaries of the latest articles and posts on vulnerability topics.
•	Identify any vulnerabilities that are not covered by Flexera or that have high public attention or exploitation potential.
•	Note down the CVE IDs, severity scores, and affected versions of these vulnerabilities.

Step 3: Create list of vulnerabilities to research based on severity
•	Combine the CVE IDs from Flexera and Feedly into a single list.
•	Sort the list by severity score in descending order.
•	Remove any duplicates or irrelevant entries from the list.
•	Save the list as a CSV file and name it as "vulnerabilities_to_research.csv".

Step 4: Disregard vulnerabilities whose impact and likelihood of exploitation is very low
•	Open the CSV file and review each vulnerability in the list.
•	For each vulnerability, check the following criteria:
•	The vulnerability affects a technology or product that is used in our environment.
•	The vulnerability has a CVSS score of 4.0 or higher.
•	The vulnerability has a known exploit or proof-of-concept code available.
•	The vulnerability has been reported by multiple sources or has high media attention.
•	If a vulnerability does not meet any of the criteria, remove it from the list.
•	Save the updated CSV file and name it as "vulnerabilities_to_assess.csv".

Step 5: For vulnerabilities of interest, check for detection capability in Qualys
•	Log in to Qualys and navigate to the KnowledgeBase.
•	Search for each CVE ID in the CSV file and check if there is a corresponding QID (Qualys ID) for it.
•	If there is a QID, note down the QID and the detection method (remote or authenticated) for the vulnerability.
•	If there is no QID, note down that the vulnerability is not detected by Qualys.
•	Add the QID and detection method information to the CSV file as new columns.
•	Save the updated CSV file and name it as "vulnerabilities_to_detect.csv".

Step 6: Check for coverage gaps in our environment through Axonius
•	Log in to Axonius and navigate to the Devices page.
•	Filter the devices by the technologies and products that are affected by the vulnerabilities in the CSV file.
•	Export the filtered devices as a CSV file and name it as "affected_devices.csv".
•	Open the CSV file and compare the versions of the technologies and products on the devices with the versions that are vulnerable in the CSV file.
•	Identify any devices that are running vulnerable versions and note down their names, IP addresses, and owners.
•	Add the device information to the CSV file as new columns.
•	Save the updated CSV file and name it as "vulnerabilities_to_remediate.csv".

Step 7: Perform any additional checks
•	Review the CSV file and verify that the information is accurate and complete.
•	Perform any additional checks that are required by the vulnerability management policy or the security team.
•	Update the CSV file with any new or revised information as needed.
•	Save the final CSV file and name it as "vulnerabilities_to_track.csv".

Step 8: Add remaining items to the vulnerability tracker
•	Log in to the vulnerability tracker and create a new entry for each vulnerability in the CSV file.
•	Fill in the entry with the relevant information from the CSV file, such as CVE ID, severity score, QID, detection method, affected devices, etc.
•	Assign a priority and a status to each entry based on the vulnerability management policy and the security team's guidance.
•	Save the entries and update the tracker.

Step 9: If needed, contact any business units responsible for affected products
•	Review the CSV file and identify any vulnerabilities that affect products that are owned or managed by other business units.
•	Contact the owners or managers of these products and inform them of the vulnerabilities and the remediation steps.
•	Provide them with the relevant information from the CSV file and the vulnerability tracker.
•	Follow up with them until the vulnerabilities are resolved or mitigated.

Step 10: Add items that need to be discussed further to the daily intel notes
•	Review the CSV file and the vulnerability tracker and identify any vulnerabilities that need to be discussed further with the security team or the management.
•	Add these vulnerabilities to the daily intel notes and provide a brief summary of the issue and the action plan.
•	Share the daily intel notes with the security team and the management and participate in the discussion.


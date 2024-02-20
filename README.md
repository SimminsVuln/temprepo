The Attached document reviews all the CVEs from the QID’s that we consider important (QID’s by the most severe QDS Scores). In the spreadsheet is a list of all the CVE’s by QID, CVSS and EPSS. There is also a column for Priority, as well as if the CVE was in CISA KEV. Below is the rationale and explanation for the Prioritization Column.
Priority	Description
Priority 1+	CVEs found in CISA's KEV + CVE in the Upper Right Quadrant | Lower Right Quadrant
Priority 1	CVEs in the Upper Right Quadrant
Priority 2	CVEs in the Lower Right Quadrant
Priority 3	CVEs in the Upper Left Quadrant
Priority 4	CVEs in the Lower Left Quadrant

Explanation and rationale regarding Prioritization:
The figure below shows the correlation between EPSS and CVSS scores. EPSS produces prediction scores between 0 and 1 (0 and 100%) indicating the likelihood of exploitation within 30 days. 
 

From the data you can see that most vulnerabilities are at the lower part of the plot, and only a few vulnerabilities have EPSS scores over 50%. There is some relation between EPSS and CVSS scores, but this plot mainly suggests that attackers are not just aiming at vulnerabilities that are trivial to exploit or have the greatest impact, challenging the usual belief that attackers are only trying to take advantage of the most serious vulnerabilities. So, how can VM and our patching teams prioritize what to patch first? 
•	Vulnerabilities that are in the upper right quadrant are the most severe types of vulnerabilities that have a higher chance of being exploited and could completely breach the information system. They should be fixed first.

•	Vulnerabilities in the bottom right are those that, although they can affect the information system badly, have a lower chance of being exploited compared to others, but should still be monitored in case the risk level changes. 

•	Vulnerabilities in the upper left quadrant have a higher chance of being exploited, but they would not cause critical damage to the information system by themselves. When considering prioritization ensure that research has been done on if these vulnerabilities can be used in chaining attacks.

•	The bottom left of the chart shows vulnerabilities that are less likely to be exploited and less damaging to the information system, and therefore can be given lower priority.


A new Ransomware-as-a-Service dubbed “RansomHub” has become one of the largest ransomware groups in the threat landscape this year. RansomHub operates as a data theft and extortion group that sells stolen files. An analysis of the ransomware revealed a high degree of code overlapping with the now-defunct Knight / Cyclops ransomware. Both are written in the Go language, encoded important strings with unique keys, restarted endpoints in safe mode before encryption, and used the same command execution sequence. 

In recent attacks, RansomHub appeared to gain initial access by exploiting the 4-years old Zerologon vulnerability (CVE-2020-1427), which allows attackers to gain domain administrator privileges and control the entire domain. Before deploying ransomware, the attackers abuse legitimate tools like Atera and Splashtop to facilitate remote access and used NetScan to retrieve target devices’ information. 

According to the Symantec report and Flashpoint data, RansomHub has the second-highest victim count in the past 90 days, only behind LockBit. One contributing factor to this high count is that the group appears to consist of experienced, veteran ransomware operators, that has reportedly attracted former BlackCat ransomware affiliates, including Notchy and Scattered Spider.

https://symantec-enterprise-blogs.security.com/threat-intelligence/ransomhub-knight-ransomware

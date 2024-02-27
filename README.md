251530
SA124191	2	Highly critical
Oracle Solaris Multiple Third Party Components Multiple Vulnerabilities

Multiple vulnerabilities have been reported in Oracle Solaris, where multiple have an unknown impact and the other ones can be exploited by malicious, local users to bypass certain security restrictions, cause a DoS (Denial of Service), gain escalated privileges, and compromise a vulnerable system, by malicious users to disclose sensitive information and cause a DoS, and by malicious people to conduct HTTP request smuggling attacks, disclose sensitive information, manipulate certain data, bypass certain security restrictions, cause a DoS, and compromise a vulnerable system.  For more information: SA113093 (#5) SA113265 (#1) SA114422 (#1) SA117656 (#1) SA118217 (#1) SA118906 (#1) SA119165 (#1) SA119627 (#1 and #2) SA119774 (#1 and #2) SA119962 (#1) SA120126 (#2) SA120346 (#1 and #2) SA120647 (#1) SA120752 (#1) SA120858 (#1) SA120903 (#1) SA121045 (#1 and #2) SA121450 (#1 and #2) SA121558 (#1) SA121933 (#1 and #2) SA122039 (#1) SA122065 (#1) SA122115 (#1 and #2) SA122241 (#1 and #2) SA122291 (#1) SA122462 (#1) SA122515 (#1) SA122580 (#3) SA123122 (#2)  1) An error related to the "_dwarf_check_string_valid()" function (dwarf_util.c) can be exploited to cause an out-of-bounds read memory access and subsequently execute arbitrary code.  2) A use-after-free error related to collapsed forwarding can be exploited to cause a DoS condition.  3) An error related to the "SetUpPhonemeTable()" function (synthdata.c) can be exploited to cause an out-of-bounds read memory access.  4) An error when when parsing HTTP headers can be exploited to cause a DoS condition.  The vulnerabilities are reported in version 11.4.	

Update to version 11.4 SRU 66 

cve_id	priority	epss	cvss
CVE-2023-4863	Priority 1+	0.46026	8.8
CVE-2023-46847	Priority 2	0.03025	7.5
CVE-2023-46846	Priority 4	0.00412	5.3
CVE-2023-46751	Priority 2	0.0009	7.5
CVE-2022-46344	Priority 2	0.02444	8.8
CVE-2023-6174	Priority 2	0.00052	6.5
CVE-2023-45285	Priority 2	0.0006	7.5
CVE-2024-25617	Priority 4	0.00043	5.3
CVE-2023-39326	Priority 4	0.00052	5.3
CVE-2023-34872	Priority 4	0.00164	5.5
CVE-2023-5367	Priority 2	0.00066	7.8
CVE-2023-51385	Priority 2	0.00189	6.5
CVE-2023-43789	Priority 4	0.00042	5.5
CVE-2023-48795	Priority 3	0.71637	5.9
CVE-2022-46285	Priority 2	0.00389	7.5
CVE-2023-5764	Priority 2	0.00042	7.8
CVE-2023-46848	Priority 2	0.01357	7.5
CVE-2020-22218	Priority 2	0.00049	7.5
CVE-2023-6478	Priority 2	0.00176	7.5
CVE-2024-20918	Priority 2	0.00079	7.4
CVE-2023-5574	Priority 2	0.00045	7
CVE-2023-6856	Priority 2	0.0054	8.8
CVE-2023-49286	Priority 2	0.0194	7.5
CVE-2023-43787	Priority 2	0.00042	7.8
CVE-2023-5363	Priority 2	0.00115	7.5
CVE-2023-22053	Priority 4	0.0011	5.9
CVE-2019-25051	Priority 2	0.0007	7.8
CVE-2023-39615	Priority 2	0.00046	6.5
CVE-2022-32200	Priority 2	0.00104	7.8
CVE-2023-49285	Priority 2	0.01466	7.5
CVE-2023-5380	Priority 4	0.00044	4.7
CVE-2023-44487	Priority 1+	0.70585	7.5
CVE-2024-26192	Priority 2	0.00087	8.2
CVE-2024-21423	Priority 4	0.00046	4.8



https://www.oracle.com/security-alerts/bulletinjan2024.html,https://github.com/davea42/libdwarf-code/issues/116,https://github.com/squid-cache/squid/security/advisories/GHSA-rj5h-46j6-q2g5,https://github.com/squid-cache/squid/security/advisories/GHSA-h5x6-w8mv-xfpr,https://github.com/espeak-ng/espeak-ng/issues/1824
![image](https://github.com/SimminsVuln/temprepo/assets/147641659/ba4ffc4d-7f14-45dd-8962-9f42f22c9845)

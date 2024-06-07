
A vulnerability exists within the Netlogon component in Windows Server 2019 which may mishandle secure connections to domain controllers via the Netlogon Remote Protocol (MS-NRPC). The error lies in the ComputeNetlogonCredential functions implementation of the AES-CFB8 cryptographic cipher, which results in predictable ciphertext when keys are reused over an average of 256 applications.

Analysis
An attacker could exploit this vulnerability to gain access to administrator privileges. This vulnerability needs to be exploited from a system with access to the Domain Controller. The most likely attack vector would be an attacker who has first gained access to the same local network segment or through an already compromised system. 

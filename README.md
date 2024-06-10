
National Vulnerability Database has provided the following description: In PHP versions 8.1.
before 8.1.29, 8.2.
before 8.2.20, 8.3.* before 8.3.8, when using Apache and PHP-CGI on Windows, if the system is set up to use certain code pages, Windows may use "Best-Fit" behavior to replace characters in command line given to Win32 API functions. PHP CGI module may misinterpret those characters as PHP options, which may allow a malicious user to pass options to PHP binary being run, and thus reveal the source code of scripts, run arbitrary PHP code on the server, etc.

DEVCORE has provided the following workaround:

An attacker could exploit this vulnerability to execute arbitrary code. An attacker would need to send a specially crafted request leveraging the %AD unicode character to bypass the escaping of special characters by the CGI handler. This vulnerability is a bypass for the fix for CVE-2012-1823.

Current information suggests only PHP running on Windows is affected;

Detections are in the pipeline for Qualys

1. For users who cannot update PHP

Attacks can be blocked through the following Rewrite rules. Please note that this rule is only a temporary mitigation mechanism for Traditional Chinese, Simplified Chinese and Japanese languages . In practice, it is still recommended to update to a repaired version or change the architecture.

RewriteEngine On
RewriteCond %{QUERY_STRING} ^%ad [NC]
RewriteRule .? - [F,L]
2. For XAMPP for Windows users

Attacks can be blocked through the following Rewrite rules. Please note that this rule is only a temporary mitigation mechanism for Traditional Chinese, Simplified Chinese and Japanese languages . In practice, it is still recommended to update to a repaired version or change the architecture.

RewriteEngine On
RewriteCond %{QUERY_STRING} ^%ad [NC]
RewriteRule .? - [F,L]

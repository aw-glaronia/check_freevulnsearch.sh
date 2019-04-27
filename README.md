# check_freevulnsearch.sh
Shell-Script for Nagios, that uses NMAP and https://github.com/OCSAF/freevulnsearch to find vulnerabilities.

Please Note that you need to preinstall NMAP and the freevulnsearch script from https://github.com/OCSAF/freevulnsearch to get this working.

Usage:
`<check_freevulnsearch.sh [Hostame or IP] [v for NMAP-Output / f for CVE-Output / empty for no Diagnostic-Data]>`
`<check_freevulnsearch.sh scanme.nmap.org v>`


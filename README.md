# check_freevulnsearch.sh
Shell-Script for Nagios, that uses NMAP and https://github.com/OCSAF/freevulnsearch to find vulnerabilities. Provides Performance-Data to Nagios.

Some parameters may must be changed in the script itself.

Please Note that you need to preinstall NMAP and the freevulnsearch script from https://github.com/OCSAF/freevulnsearch to get this working. Please refer to https://github.com/OCSAF/freevulnsearch/blob/master/README.md for a detailed installation manual.

### Usage:
`check_freevulnsearch.sh [Hostame or IP] [v for NMAP-Output / f for CVE-Output / empty for no Diagnostic-Data]`

### Example:
`check_freevulnsearch.sh scanme.nmap.org v`


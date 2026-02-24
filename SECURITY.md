# Security Policy
## Supported Versions

These repositories contain Lua modcharts and Psych Engine–based modifications. Due to the archival nature of many of these projects, only actively maintained repositories are eligible for security review or fixes.

| Repository / Version Branch             | Supported |
| --------------------------------------- | --------- |
| main (current active projects)          | Yes       |
| the-modcharts                           | Yes       |
| moremmodd                               | Limited   |
| myths-of-yamaha-nakis-charts            | Limited   |
| moremods                                | No        |
| moremmod-old                            | No        |
| Analog-Funkin'-Naki's-Charts            | No        |
| gorefieldxyamahaxMCMDEMO                | No        |
| gorefieldxyamaha                        | No        |
| MCM-Fan-mod(with-psych-engine-built-in) | No        |
| OlderMCMMODCHARTS>.>                    | No        |
| GOREFIELD-V2-PSYCH-ENGINE-PORT          | No        |
| BFCI-BFAND+                             | No        |
| oldervers                               | No        |

## What “Limited” Means

Limited support means:

- Critical vulnerabilities may be reviewed  
- Fixes are not guaranteed  
- No active feature development  
- Projects marked “No” are archived and will not receive updates  

---

## What Counts as a Security Issue

For these repositories, security issues may include:

- Malicious Lua execution vectors  
- Remote code execution through modchart scripts  
- Exploits involving Psych Engine integrations  
- Script injection vulnerabilities  
- Unauthorized file access or unsafe file operations  
- Any exploit that could harm user systems  

**Note:** Gameplay bugs, chart desync issues, or engine compatibility errors are **not** considered security vulnerabilities.

---

## Reporting a Vulnerability

If you discover a legitimate security vulnerability:

1. **Do NOT** open a public issue  
2. **Do NOT** publicly disclose the exploit  
3. Contact the repository owner directly via:  
   - GitHub private message  
   - Or the contact method listed in the repository profile  

When reporting, include:

- The affected repository name  
- Clear reproduction steps  
- Engine version used  
- Proof of concept if applicable  
- Screenshots or logs if relevant  

---

## Response Timeline

- **Initial acknowledgment:** within 7 days  
- **Review and confirmation:** within 14 days  
- **Patch release (if applicable):** depends on severity and project status  

> Not all reported issues will result in a patch, especially for unsupported or archived projects.

---

## Disclosure Policy

If a vulnerability is confirmed and fixed:

- A patch note will be added to the repository  
- The issue may be publicly documented after resolution  

If declined:

- A brief explanation may be provided  
- No further action will be taken  

---

## Important Notice

These projects are hobbyist modchart repositories. They are provided **as-is** without warranty. Users install and execute them at their own discretion.

Only code written and maintained by the repository owner is covered under this policy. Third-party assets, engines, or bundled tools follow their own security policies.

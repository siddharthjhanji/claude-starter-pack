---
name: cybersecurity-skills
description: "Two cybersecurity skill collections vendored on 2026-06-09. Masriyan 15 broad-domain skills (renamed from 01-recon-osint → recon-osint, etc.) + 42 curated micro-skills from mukul975's 754-skill library. Heavy forensics/red-team/IR portions of mukul intentionally NOT vendored (would add ~75k tokens metadata per session and require missing tools)."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Cybersecurity Skill Collections

Vendored 2026-06-09. Two sources combined into a curated set of 57 cybersec skills.

## Source 1: Masriyan/Claude-Code-CyberSecurity-Skill (15 broad domains)

Repo: https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill
License: Repo doesn't state — assume MIT-style (community skill pack).

Curriculum-style broad domains; each skill is one whole area, not a single tool. Original folder names had `NN-` numeric prefixes — renamed on vendor to drop them so triggers are cleaner.

| Skill (vendored name) | Original | Covers |
|---|---|---|
| `recon-osint` | 01-recon-osint | Subdomain enum, DNS analysis, tech fingerprinting, OSINT correlation |
| `vulnerability-scanner` | 02-vulnerability-scanner | Dep auditing, CVE detection, CVSS scoring, vuln reporting |
| `exploit-development` | 03-exploit-development | PoC dev, payload crafting, shellcode analysis (authorized testing) |
| `reverse-engineering` | 04-reverse-engineering | Binary RE workflows |
| `malware-analysis` | 05-malware-analysis | Static + dynamic malware analysis |
| `threat-hunting` | 06-threat-hunting | Hunt methodology + queries |
| `incident-response` | 07-incident-response | IR playbooks, triage flow |
| `network-security` | 08-network-security | Network defense + analysis |
| `web-security` | 09-web-security | Web app sec, OWASP |
| `cloud-security` | 10-cloud-security | AWS/Azure/GCP security |
| `csoc-automation` | 11-csoc-automation | SOC automation patterns |
| `log-analysis` | 12-log-analysis | Log triage + correlation |
| `crypto-analysis` | 13-crypto-analysis | Crypto review |
| `red-team-ops` | 14-red-team-ops | Red team methodology |
| `blue-team-defense` | 15-blue-team-defense | Blue team defense playbook |

## Source 2: mukul975/Anthropic-Cybersecurity-Skills (42 curated of 754)

Repo: https://github.com/mukul975/Anthropic-Cybersecurity-Skills
License: Apache-2.0
**Only 42 of 754 vendored.** The full library is excellent but heavy on forensics tools (Volatility, Autopsy, FTK, Hindsight) and red-team infra (Cobalt Strike, Empire, Sliver) — orthogonal to the user's data/analytics role at IM8.

### Selection criteria
Picked based on IM8/Prenetics context:
- IM8 is on Azure (Databricks workspace, IM8 dashboards) → Azure + cloud-storage + Office365 skills
- IM8 dashboards/finance hub → web + API + TLS + cert transparency
- Compliance (FDA QSR, ISO 27001, SOC 2 already covered elsewhere) → identity, log analysis, detection rules

### 42 curated skills

**Cloud / Azure (8)** — IM8 runs on Azure Databricks:
- `analyzing-azure-activity-logs-for-threats`
- `auditing-azure-active-directory-configuration`
- `building-cloud-siem-with-sentinel`
- `auditing-aws-s3-bucket-permissions`
- `auditing-gcp-iam-permissions`
- `analyzing-cloud-storage-access-patterns`
- `auditing-cloud-with-cis-benchmarks`
- `analyzing-office365-audit-logs-for-compromise`

**Kubernetes / Containers (3)**:
- `analyzing-kubernetes-audit-logs`
- `auditing-kubernetes-cluster-rbac`
- `analyzing-docker-container-forensics`

**Supply chain (4)**:
- `analyzing-sbom-for-supply-chain-vulnerabilities`
- `analyzing-supply-chain-malware-artifacts`
- `analyzing-typosquatting-domains-with-dnstwist`
- `building-devsecops-pipeline-with-gitlab-ci`

**Web app security (5)** — im8.com, im8-analytics-dashboard:
- `analyzing-web-server-logs-for-intrusion`
- `analyzing-api-gateway-access-logs`
- `analyzing-malicious-url-with-urlscan`
- `analyzing-certificate-transparency-for-phishing`
- `analyzing-tls-certificate-transparency-logs`

**Email / phishing (1)**:
- `analyzing-email-headers-for-phishing-investigation`

**Detection / SIEM (5)**:
- `building-detection-rules-with-sigma`
- `building-detection-rule-with-splunk-spl`
- `analyzing-security-logs-with-splunk`
- `analyzing-windows-event-logs-in-splunk`
- `analyzing-linux-audit-logs-for-intrusion`

**Incident response (3)**:
- `triaging-security-incident`
- `analyzing-indicators-of-compromise`
- `automating-ioc-enrichment`

**Identity / IAM (3)**:
- `building-identity-federation-with-saml-azure-ad`
- `building-identity-governance-lifecycle-process`
- `analyzing-active-directory-acl-abuse`

**Network analysis (4)**:
- `analyzing-dns-logs-for-exfiltration`
- `analyzing-network-flow-data-with-netflow`
- `analyzing-network-traffic-for-incidents`
- `analyzing-network-traffic-with-wireshark`

**Threat intel (3)**:
- `analyzing-threat-intelligence-feeds`
- `analyzing-threat-landscape-with-misp`
- `analyzing-threat-actor-ttps-with-mitre-attack`

**Misc (3)**:
- `analyzing-ransomware-leak-site-intelligence`
- `building-incident-response-dashboard`
- `building-attack-pattern-library-from-cti-reports`

## What was deliberately NOT vendored from mukul (712 skills)

Heavy specialized categories skipped:
- **Forensics tooling** — Volatility, Autopsy, FTK, LiME, hindsight (require tools not installed)
- **Red team infrastructure** — Cobalt Strike, Empire, Sliver, malleable C2 profiles (orthogonal to role)
- **Reverse engineering** — Ghidra, IDA, x64dbg deep dives (Masriyan's `reverse-engineering` covers methodology)
- **Mobile** — Android/iOS deep forensics (no relevance)
- **Crypto / blockchain** — Ethereum smart contracts, ransomware payment wallets (not IM8 scope)
- **Memory forensics** — RAM dump analysis, kernel rootkits (no SOC role)
- **Most malware analysis micro-skills** — Linux ELF, packed binaries, UPX unpacking, Cuckoo sandboxing
- **Many Windows artifact micro-skills** — Prefetch, Amcache, Shellbag, LNK, MFT (forensic IR-deep)

If any of these become needed: clone the source repo and copy the specific skill. The naming is consistent: `analyzing-X-with-TOOL` or `building-X-with-TOOL` — easy to grep.

## Relationship to existing security skills

Already had:
- [[reference_security_review]] — `/security-review` custom 3-phase audit
- [[ai-inventory]] (Snyk) — Python AI/ML AIBOM
- [[sbom-analyzer]] (Snyk) — SBOM parsing
- [[snyk-fix]], [[iac-security]], [[container-security]], [[drift-detector]], [[secure-at-inception]], [[secure-dependency-health-check]]
- [[skill-security-auditor]] (alirezarezvani) — skill repo audit
- Trail of Bits: [[static-analysis]], [[semgrep-rule-creator]], [[variant-analysis]]
- Compliance: [[soc2-audit-prep]], [[iso27001-audit-prep]], [[gdpr-audit-prep]], [[aims-audit]], [[ai-act-readiness]], [[information-security-manager-iso27001]]
- C-level: [[ciso-advisor]], [[ciso-review]]

**The new 57 skills fill the gaps:** detection engineering (Sigma/SPL), Azure-specific audit, network/log triage, threat hunting methodology, and IR workflow. They complement rather than duplicate.

## When this memory matters

- User asks about cybersecurity / SOC / IR / detection / threat hunting
- IM8 has a security incident or needs an audit
- Considering a SIEM (Sentinel / Splunk) for IM8 infrastructure
- User mentions a CVE, vulnerability, suspicious log entry

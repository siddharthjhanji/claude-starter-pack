---
name: snyk-studio-recipes
description: "Snyk Studio Recipes — 8 security/SBOM skills for vulnerability scanning, dependency health, IaC security, container security, AI inventory tracking. Vendored locally."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Snyk Studio Recipes (8 skills)

Repo: https://github.com/snyk/studio-recipes
Vendored: 2026-05-30 — all 8 skills in `~/.claude/skills/`

## Skills

| Skill | What it does |
|---|---|
| `snyk-fix` | Automated fix for Snyk-detected vulnerabilities |
| `secure-dependency-health-check` | Dep health audit with CVE detection |
| `secure-at-inception` | Shift-left security gates during project init |
| `sbom-analyzer` | Software Bill of Materials parsing + risk assessment |
| `iac-security` | Infrastructure-as-Code security scanning (Terraform, K8s, CloudFormation) |
| `drift-detector` | Detect config drift between repo and deployed state |
| `container-security` | Container image vulnerability scanning |
| `ai-inventory` | AIBOM — inventory AI models/datasets/frameworks in Python AI/ML projects (PyTorch, TensorFlow, HuggingFace) |

## When to use
Pairs well with [[reference_security_review]] (custom 3-phase audit) and [[skill-security-auditor]] from alirezarezvani.

For Prenetics/IM8 context: `ai-inventory` is genuinely relevant if any internal AI/ML project needs an AIBOM for compliance under EU AI Act / FDA AI/ML SaMD guidance — see [[ai-act-readiness]], [[fda-qsr-audit-prep]].

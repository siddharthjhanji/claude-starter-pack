---
name: niche-idea-generator
description: Generate niche SaaS ideas based on founder expertise, industry access, and mandatory workflow patterns. Use when you want to discover lifestyle SaaS opportunities ($1-3M ARR, solo/duo team) that match your unique advantages. Triggers on requests like "generate niche ideas", "find SaaS opportunities for me", "what niches should I explore", "help me find a vertical SaaS idea", or "discover business opportunities". Outputs 5-10 concrete hypotheses ready for first-pass evaluation.
---

# Niche Idea Generator — Lifestyle SaaS

## Goal

Generate 5–10 concrete niche SaaS hypotheses based on your unique advantages (expertise, access, background) that could realistically reach $1–3M ARR with a solo/duo team.

**Not generic brainstorming.** Every idea must have:
- A specific mandatory workflow or compliance requirement
- An identifiable distribution path
- Pricing that doesn't require 5,000+ customers

## Voice

Direct and specific. No "you could potentially explore healthcare" — output "Optometry: Software for managing state vision therapy certification renewals (CA, TX, FL require biennial renewal)."

If you don't have enough founder context to generate relevant ideas, ask for it.

## Inputs

Ask for missing inputs:

### Required
- **Background / Expertise**: Industries you've worked in, roles, domains you understand deeply
- **Natural Access**: Who can you reach? (former colleagues, professional network, geographic advantages)
- **Interests**: What types of customers would you enjoy serving for 3+ years?

### Optional but Helpful
- **Geography focus**: Where do you want to sell? (US default, but state/region can narrow)
- **Avoid list**: Industries/verticals you explicitly don't want to touch
- **Technical constraints**: Any hard technical limits (e.g., no mobile apps, no real-time systems)

## Strategy

Generate ideas by combining:

1. **Founder's unique wedge** (what access/knowledge do they have that others don't?)
2. **Mandatory paperwork patterns** (compliance, licensing, certifications, audits, permits)
3. **Distribution surfaces** (lists, registries, associations, channel partners)

### Idea Generation Process

#### Step 1: Map Founder Advantages

Based on inputs, identify:
- **Domain expertise**: What industries/workflows do they understand?
- **Buyer access**: Who can they reach directly?
- **Technical strengths**: What can they build quickly?
- **Unfair advantages**: Former employer relationships, certifications, geographic proximity

#### Step 2: Research Compliance Patterns

For each relevant industry from Step 1, research:

**Use web search and public databases to find:**
- State/federal licensing requirements
- Professional certifications with renewal cycles
- Mandatory reporting/filing deadlines
- Industry-specific compliance obligations
- Recent regulatory changes creating new burdens

**Look for:**
- Annual/biennial/quarterly submission cycles
- Multi-step approval processes
- State-by-state variations
- Penalty structures for non-compliance
- Industries with 10,000–100,000 license holders (not too small, not too large)

#### Step 3: Identify Distribution Paths

For each compliance pattern, verify:
- **Licensing boards** with public directories
- **Professional associations** that reach the audience
- **Suppliers/distributors** who serve the industry
- **Existing software** they already use (integration opportunities)
- **High-intent keywords** they search when facing deadlines

#### Step 4: Apply Lifestyle Filters

Only suggest ideas that pass:
- **Reachable**: Can founder access 100+ buyers in first 90 days?
- **Buildable**: Can core v1 ship in 2–8 weeks?
- **Priceable**: Does ARPA of $100–$500/mo seem fair for value delivered?
- **Sustainable**: Would founder care about this market in year 3?

#### Step 5: Generate Hypotheses

Output 5–10 ideas, each with:
- **One-sentence description** of who + what mandatory workflow
- **Paperwork wedge** (specific form, filing, or certification)
- **Distribution hint** (how to reach first 50 customers)
- **Lifestyle math** (rough customer count needed for $1M ARR)
- **Why founder has an edge** (based on their inputs)

## Research Sources

Use web search to find:

### Government/Regulatory
- State licensing boards (search: "[state] professional licensing board")
- Federal compliance databases (OSHA, EPA, DOL, FDA, etc.)
- State secretary of state business registries
- Municipal permit systems

### Industry Associations
- Professional associations by industry
- Trade groups with membership directories
- Industry conference exhibitor lists

### Compliance Calendars
- Tax filing deadlines by industry
- Certification renewal cycles
- Annual reporting requirements
- State-by-state compliance variations

### Market Size Proxies
- Number of active licenses by state
- Professional certification counts
- Business registry statistics
- Industry employment data

## Output Format

**Filename:** `Niche_Ideas_<founder_name>.md`

```markdown
# Niche Ideas for [Founder Name]

## Your Wedge

**Background:** [Summary of founder's expertise]
**Natural Access:** [Who they can reach]
**Interests:** [What they'd enjoy]

## Generated Ideas (Ranked by Founder Fit)

---

### Idea 1: [Industry] — [Specific Workflow]

**One-line:** Software for [buyer persona] to manage [mandatory workflow/compliance requirement].

**Paperwork Wedge:**
- What: [Specific form, filing, certification, or report]
- Frequency: [Annual / Biennial / Quarterly / Event-triggered]
- Penalty for missing: [Fines / License suspension / Revenue loss]
- Current process: [Manual / Spreadsheet / Email chaos]

**Distribution Path:**
- **Primary:** [Licensing board directory / Association list / Channel partner]
- **Secondary:** [Integration hook / Inbound keywords / Referral network]
- **Estimated reach:** Can access X buyers in first 90 days

**Lifestyle Math:**
- **Market size:** ~X license holders in [geography]
- **Target ARPA:** $Y/month
- **Customers for $1M ARR:** Z customers (X × $Y)
- **Reachable:** Yes/No (can you access this many?)

**Why You Have an Edge:**
[Specific advantage based on founder's background/access]

**Confidence Level:** High / Medium / Speculative

**Next Step:**
Run First Pass evaluation. Focus research on: [specific question to answer]

---

### Idea 2: [Industry] — [Specific Workflow]

[Repeat structure]

---

### Idea 3: [Industry] — [Specific Workflow]

[Repeat structure]

---

[Continue for 5-10 ideas]

---

## Ideas Considered but Rejected

| Industry | Why Rejected |
|----------|--------------|
| [Example] | No clear distribution path |
| [Example] | Would require 10,000+ customers |
| [Example] | Founder has no access to buyers |

## Research Gaps

What we couldn't verify (requires founder legwork):
1. [Gap 1]
2. [Gap 2]
3. [Gap 3]

## Recommended Next Steps

1. **Pick top 2–3 ideas** that feel most exciting
2. **Run First Pass evaluation** on each
3. **Make 10 calls** to potential buyers in your top choice
4. **Kill or pursue** based on what you hear

## Resources for Deeper Research

**Licensing boards:**
- [Relevant state licensing board URLs]

**Associations:**
- [Relevant professional associations]

**Compliance calendars:**
- [Relevant regulatory calendars]

**Market data:**
- [Census data, employment stats, etc.]
```

## Quality Standards

Every generated idea must:

1. **Be specific**: Not "accounting software" but "Software for California CPAs to manage biennial ethics credit tracking for license renewal"

2. **Name the paperwork**: Identify the exact form, filing, or compliance artifact

3. **Show distribution**: Point to an actual list, board, or association

4. **Pass lifestyle math**: Show the ARPA × customer count to hit $1M ARR

5. **Leverage founder's edge**: Explain why THIS founder has an advantage

## Anti-Patterns (Do Not Generate)

❌ Generic productivity tools ("project management for X")
❌ Nice-to-have analytics/dashboards
❌ Ideas requiring 5,000+ customers
❌ Industries founder explicitly said to avoid
❌ Markets with no identifiable distribution
❌ Ideas requiring VC funding or large teams

## Example Founder Input → Idea

**Input:**
- Background: 5 years as compliance officer at regional bank
- Access: Former colleagues at 20+ credit unions in Southeast
- Interests: Would enjoy serving credit unions long-term
- Geography: Southeast US initially

**Generated Idea:**

**Credit Unions — BSA/AML Transaction Monitoring Log**

**One-line:** Software for credit unions (< 500M assets) to manage Bank Secrecy Act transaction monitoring documentation and quarterly board reporting.

**Paperwork Wedge:**
- What: BSA/AML monitoring logs + quarterly board reports required by NCUA
- Frequency: Daily monitoring, quarterly board reporting, annual audit prep
- Penalty: Regulatory enforcement actions, fines up to $25K/day, charter risk
- Current process: Excel trackers, manual PDF compilation, email trails

**Distribution Path:**
- Primary: Direct outreach to 20+ credit unions via former colleagues
- Secondary: NCUA has public directory of all federally insured credit unions
- Integration: Tie into their core banking system (Symitar, DNA, etc.)
- Estimated reach: Can access 50+ CUs in first 90 days via warm intros

**Lifestyle Math:**
- Market size: ~5,000 credit unions in US, ~800 in Southeast
- Target ARPA: $300/month ($200 base + $100 for reporting module)
- Customers for $1M ARR: 278 customers
- Reachable: Yes (founder has direct access to decision-makers)

**Why You Have an Edge:**
- Understands exact pain point from compliance officer role
- Knows the BSA/AML framework and audit requirements
- Has warm network into 20+ credit unions
- Can speak their language (NCUA regs, examiner expectations)

**Confidence Level:** High

**Next Step:**
Run First Pass. Key question: Are credit unions currently paying for any compliance software, or is everything Excel-based?

---

## When to Stop Generating

Stop when you have:
- 5–10 solid ideas
- At least 2–3 that founder finds exciting
- Enough variety to compare different distribution paths

Don't generate 50 mediocre ideas. Better to have 5 strong ones.

## Voice Reminders

- State facts, not possibilities ("X licensing board has public directory" not "you could potentially reach them")
- Be blunt about weaknesses ("No distribution path identified" not "distribution might be challenging")
- Cite sources when available ("[State] licensing board lists 1,247 active licenses")
- Mark speculation clearly ("Estimated" / "Assumed" / "Requires validation")

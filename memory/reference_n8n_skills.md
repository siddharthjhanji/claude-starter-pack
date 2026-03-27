---
name: n8n Skills for Claude Code
description: 7 Claude Code skills for building production-ready n8n workflows using n8n-mcp MCP server. Covers expressions, MCP tools, patterns, validation, node config, JS/Python code nodes.
type: reference
---

Repo: https://github.com/czlonkowski/n8n-skills
Author: Romuald Członkowski (aiadvisors.pl)
Stats: 3.8k stars | 668 forks | MIT | 525+ nodes | 2,700+ templates

**Prerequisite**: n8n-mcp MCP server must be installed and configured in `.mcp.json`

---

## The 7 Skills (use together)

| Skill | Trigger | Purpose |
|-------|---------|---------|
| `n8n-mcp-tools-expert` | **HIGHEST PRIORITY** — any n8n tool use | How to use MCP tools effectively |
| `n8n-expression-syntax` | Writing `{{}}` expressions | Correct syntax, variables, gotchas |
| `n8n-workflow-patterns` | Building/designing workflows | 5 proven architectural patterns |
| `n8n-validation-expert` | Validation errors/warnings | Fix errors, handle false positives |
| `n8n-node-configuration` | Configuring specific nodes | Operation-aware, property dependencies |
| `n8n-code-javascript` | JS in Code nodes | Data access, $helpers, DateTime |
| `n8n-code-python` | Python in Code nodes | Python beta limitations, standard lib only |

**Cross-skill flow**: Patterns → MCP Tools (find nodes) → Node Config → Expressions → JS/Python → Validation

---

## n8n Expression Syntax

All dynamic content uses double curly braces: `{{expression}}`

### Core Variables
```javascript
{{$json.fieldName}}                    // current node output
{{$json['field with spaces']}}
{{$json.nested.property}}
{{$json.items[0].name}}

{{$node["Node Name"].json.fieldName}}  // other nodes (case-sensitive, quoted)
{{$node["HTTP Request"].json.data}}

{{$now}}                               // current timestamp (Luxon)
{{$now.toFormat('yyyy-MM-dd')}}
{{$now.plus({days: 7})}}

{{$env.API_KEY}}                       // environment variables
```

### CRITICAL GOTCHA
- Webhook data lives under `$json.body`, NOT `$json` directly
- `$json.body.email` ✅ — `$json.email` ❌ for webhook payloads

### Common Mistakes
```
❌ $json.email          (no braces — literal text)
❌ {$json.email}        (single braces — invalid)
✅ {{$json.email}}
```

---

## n8n MCP Tools Expert

### Node Discovery
```
search_nodes({query: "keyword"})                          // <20ms
get_node({nodeType: "nodes-base.name"})                   // standard detail
get_node({nodeType: "nodes-base.name", mode: "docs"})     // readable markdown
get_node({nodeType: "nodes-base.name", detail: "full"})   // full schema
```

### Validation
```
validate_node({nodeType, config: {}, mode: "minimal"})         // required fields only
validate_node({nodeType, config, profile: "runtime"})          // full validation
validate_workflow({workflowId})
n8n_autofix_workflow({workflowId})                             // auto-fix common issues
```

### Workflow Management (most used)
```
n8n_create_workflow({...})
n8n_update_partial_workflow({...})   // MOST USED: 38,287 uses, 99% success, 18 operation types
n8n_update_full_workflow({...})      // full replacement
n8n_get_workflow({id, mode: "full|structure|minimal"})
n8n_list_workflows({...})            // with filtering/pagination
n8n_delete_workflow({id})
n8n_validate_workflow({id})
n8n_deploy_template({templateId})
n8n_workflow_versions({id})          // version history + rollback
n8n_test_workflow({id})
n8n_executions({...})
activateWorkflow / transferWorkflow  // via n8n_update_partial_workflow
```

### Templates
```
search_templates({query, mode: "keyword|by_nodes|by_task|by_metadata"})
get_template({id})
```

### Data Tables
```
n8n_manage_datatable({...})          // CRUD, filtering, dry-run
```

### Documentation
```
tools_documentation()                // meta-docs for all tools
ai_agents_guide()                    // AI agent workflow guidance
```

### Key Telemetry Patterns
- **Most common flow**: `search_nodes → get_node` (avg 18s between steps)
- **Most common validation**: `n8n_update_partial_workflow → n8n_validate_workflow` (7,841 occurrences, 23s thinking, 58s fixing)
- **Use `detail: "standard"`** for `get_node` — covers 95% of cases, 1-2K tokens

---

## n8n Workflow Patterns (5 Core)

### 1. Webhook Processing (Most Common)
```
Webhook → Validate → Transform → Respond/Notify
```
Use when: receiving data from external systems (Stripe, GitHub, Slack commands, forms)

### 2. HTTP API Integration
```
Trigger → HTTP Request → Transform → Action → Error Handler
```
Use when: fetching from REST APIs, syncing with third-party services, data pipelines

### 3. Database Operations
```
Schedule → Query → Transform → Write → Verify
```
Use when: DB sync, ETL workflows, periodic queries

### 4. AI Agent Workflow
```
Trigger → AI Agent (Model + Tools + Memory) → Output
```
Use when: conversational AI, AI with tool access, multi-step reasoning

### 5. Scheduled Tasks
```
Schedule → Fetch → Process → Deliver → Log
```
Use when: recurring reports, periodic data fetch, maintenance tasks

---

## n8n Validation Expert

### Error Severity
- **Errors** (must fix, blocks execution): `missing_required`, `invalid_value`, `type_mismatch`, `invalid_reference`, `invalid_expression`
- **Warnings** (should fix): `best_practice`, `deprecated`, `performance`
- **Suggestions** (optional): `optimization`, `alternative`

### Validation Loop (expect 2-3 cycles)
```
Configure node → validate_node → fix errors → validate again → n8n_update_partial_workflow
```
Avg: 23s thinking about errors, 58s fixing per cycle

### Profiles
- `"minimal"` — check required fields only (fast)
- `"runtime"` — full runtime validation
- `"ai-friendly"` — structured for AI consumption
- `"strict"` — strictest checks

---

## n8n Node Configuration

### Operation-Aware Fields
Required fields change with `resource` + `operation`:
```javascript
// Slack: post message
{ resource: "message", operation: "post", channel: "#general", text: "Hello!" }

// Slack: update message (different required fields!)
{ resource: "message", operation: "update", messageId: "123", text: "Updated!" }
```

### Property Dependencies (displayOptions)
Fields appear/disappear based on other values:
```javascript
// HTTP Request GET — no body fields
{ method: "GET", url: "https://api.example.com" }

// HTTP Request POST — body fields appear
{ method: "POST", url: "...", sendBody: true, body: { contentType: "json", content: {...} } }
```

### Progressive Discovery Pattern
1. `get_node(detail: "standard")` — covers 95% of use cases
2. `get_node(detail: "full")` — only when you need complete schema
3. `validate_node(mode: "minimal")` — check required fields first
4. `validate_node(profile: "runtime")` — full validation before save

---

## JavaScript Code Node

### Essential Rules
1. Use **"Run Once for All Items"** mode (95% of cases)
2. Access: `$input.all()`, `$input.first()`, `$input.item`
3. MUST return `[{json: {...}}]` format
4. Webhook data: `$json.body.field` NOT `$json.field`
5. Available: `$helpers.httpRequest()`, `DateTime` (Luxon), `$jmespath()`

### Mode Selection
- **Run Once for All Items**: aggregation, filtering, batch, transformations, API calls
- **Run Once for Each Item**: item-specific operations that can't be batched

### Basic Template
```javascript
const items = $input.all();
const processed = items.map(item => ({
  json: {
    ...item.json,
    processed: true,
    timestamp: new Date().toISOString()
  }
}));
return processed;
```

### $helpers.httpRequest
```javascript
const response = await $helpers.httpRequest({
  method: 'GET',
  url: 'https://api.example.com/data',
  headers: { 'Authorization': `Bearer ${$env.API_KEY}` }
});
return [{ json: response }];
```

---

## Python Code Node (Beta — prefer JS)

### When to use Python (rare cases only)
- Need specific Python stdlib functions
- Significantly more comfortable with Python
- **NOT available**: requests, pandas, numpy, or any external libs

### Available stdlib
`json`, `datetime`, `re`, `base64`, `hashlib`, `urllib.parse`, `math`, `random`, `statistics`

### Key Differences from JS
```python
# Python uses underscore prefix: _input, _json, _node
items = _input.all()

# Webhook data
_json["body"]["field"]   # NOT _json["field"]

# Return format same
return [{"json": {...}}]
```

### Basic Template
```python
items = _input.all()
processed = []
for item in items:
    processed.append({
        "json": {
            **item["json"],
            "processed": True,
            "timestamp": datetime.now().isoformat()
        }
    })
return processed
```

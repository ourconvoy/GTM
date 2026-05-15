# The Enrichment Override Pattern
### Preserving Human Corrections Across Automated Data Syncs

---

## The Problem

When AI or vendor-enriched data syncs to a CRM on a recurring basis, human corrections get overwritten. A rep fixes an incorrect company parent. The next Clay sync replaces it with the same wrong value. Without intervention, this cycle repeats indefinitely.

The standard solution uses parallel fields for each enriched data point:

1. Original CRM value (e.g., `Company_Name__c`)
2. Enriched value from Clay/AI (e.g., `Account_Parent_Enriched__c`)
3. Manual override field (e.g., `Account_Parent_Override__c`)
4. Formula or Flow field that returns the override if present, enriched value if not

This works. It does not scale. At 30 enriched data points, you have 90-120 custom fields. The data model becomes cluttered, admin overhead increases, and every new enrichment requires creating 3-4 new fields.

---

## The Override Picklist Pattern

Replace the parallel-field architecture with two fields and one piece of logic:

**`Override_Fields__c`** — A multi-select picklist listing every field eligible for override (e.g., `Account Parent`, `Industry`, `Employee Count`, `Revenue Band`). When a user selects one or more values, they are registering that those fields have been manually corrected.

**`Override_Values__c`** — A structured long text field storing corrected values (e.g., `Account Parent=Acme Corp; Industry=Financial Services`). Alternatively, this can be a related list of `Field_Override__c` records for orgs that need full audit trails.

**Apex trigger logic (before update):**

- When an enrichment integration updates a field, check whether that field's label appears in the `Override_Fields__c` picklist.
- If present: reject the incoming enrichment value and preserve the override.
- If absent: accept the new enrichment.

**Result:** One picklist + one text field replaces 60-90 override fields across 30 enriched data points.

---

## Implementation Notes

- **Distinguishing enrichment writes from human writes.** The Apex trigger must differentiate between updates coming from the enrichment integration (which should respect overrides) and updates from users (which may set new overrides). Use the integration user's profile, a custom permission, or a specific API header to identify enrichment-sourced writes.
- **Audit trail option.** For orgs with compliance requirements or complex enrichment pipelines: create a lightweight custom object (`Enrichment_Override__c`) that logs each override as a record — field name, old value, new value, who overrode it, when. This enables reporting on override frequency by field and data provider, feeding back into enrichment quality improvement.
- **Picklist maintenance.** When a new enrichment field is added to the Clay → Salesforce pipeline, add its label to the multi-select picklist. This is a one-time setup per field rather than creating 3-4 new custom fields.

---

## For Shared Reference: The Core Problem and Solution

When pulling AI-enriched fields into CRM, you need a mechanism to permanently overwrite information so the next enrichment run doesn't replace your correction.

The standard 3-4 field override pattern (original value, enriched value, override value, formula to pick the winner) produces 90-120 fields for 30 data points. It clutters the data model and doesn't scale.

A single multi-select picklist listing all overridable fields, paired with one text field for corrected values, gives your team the ability to correct any enriched data point without requiring a separate override field for each piece of information. Apex logic checks the picklist before accepting enrichment updates and preserves any flagged corrections.

This is a one-time build that scales to any number of enriched fields.

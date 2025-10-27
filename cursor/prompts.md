# Final Delivery and End Results

At the end of this workflow, you will have the following production-ready files that can be used directly for Cortex Agent setup:
Generated configuration files:

1. agent_description.md

- Purpose: Core agent identity and scope definition.
- Content: Concise, executive-focused description specifying role, target users, capabilities, and limitations.
- Usage: Copy/paste into the Cortex Agent description field.

2. tool_descriptions.md

- Purpose: Tool capability definitions for agent understanding.
- Content: Concise descriptions of when to use each tool (Cortex Analyst, Cortex Search, custom tools).
- Usage: Reference for agent tool selection logic.

3. orchestration_instructions.md

- Purpose: Multi-tool coordination and parallel execution logic.
- Content: Step-by-step orchestration patterns, business rules, and decision trees.
- Usage: Core agent instructions for tool selection and coordination.

4. response_instructions.md

- Purpose: Professional formatting and communication standards.
- Content: User-focused response patterns, data formatting rules, and business context integration.
- Usage: Agent response quality and formatting guidelines.

5. testing_strategy.md (Optional)

- Purpose: Comprehensive validation and quality assurance.
- Content: 50+ test questions covering in-scope, out-of-scope, and edge cases.
- Usage: Agent testing and validation framework.

## 1. Generate Agent Description

Copy the prompt below and paste it into the Cursor chat.

```cursor
@snowflake_agent_best_practices.md @Snowflake_Cortex_Agent

Generate a concise agent description (50–100 words) following Snowflake best practices and save it to agent_description.md:

CONTEXT:
- Business domain: ["Administrators and Users for Snowflake"]
- Primary users: ["Analysts"]
- Secondary users: ["Managers"]
- Company context: ["Snowflake Users"]
- Critical user journeys: ["Check Snowflake query cost and performance"]
- Data access limitations: ["Do not access private data if detected"]

REQUIREMENTS:
- Clear role definition with specific purpose and target users.
- Focus on core capabilities and business value propositions.
- Include scope limitations and what questions to decline.
- Professional tone with domain expertise.
- Keep it concise and actionable.
- PROFILE in the Cortex Agents object must contain only the "display_name" key; do not include other keys.
- Set the generated description in the COMMENTS field of the Cortex Agents object.

OUTPUT: Update the COMMENT and PROFILE parameters of the Cortex Agents in components/cortex_agents/housekeeping.sql with a concise agent description that follows Snowflake best practices. Also, create or replace agent_description.md under the cursor/output folder with the same content.
```

## 2. Generate Tool Descriptions

Copy the prompt below and paste it into the Cursor chat.

```cursor
@snowflake_agent_best_practices.md @Snowflake_Cortex_Agent @Snowflake_Cortex_Analyst @Snowflake_Cortex_Search

Generate concise tool descriptions for Cortex Agent configuration. Update the description in the tool_spec column of housekeeping.sql and save it to tool_descriptions.md:

CONTEXT:
- Available tools: Cortex Analyst [yaml/semantic_model.yaml], Cortex Search [Allows users to query Snowflake query history], and [Snowflake Official Documentation as a Cortex Knowledge Base service]
- Business domain: ["Snowflake Administrators and Users"]
- User personas: ["Analysts check query attribution and cost; they also consult Snowflake official documentation"]
- Data types available: [structured data, two knowledge bases]

REQUIREMENTS:
- Focus ONLY on tool descriptions (no tool selection strategies, decision trees, or conflict resolution).
- Each tool description should be 2–3 sentences maximum.
- Format: "This [tool type] provides [data type] for [business context]. Use this tool for [specific use cases]. It contains [data details]. Query this [tool type] when users ask about [specific scenarios]."
- Keep descriptions concise and focused on capabilities and use cases.
- Update ONLY the description column in tool_spec.

OUTPUT: Update the description in the tool_spec column of components/cortex_agents/housekeeping.sql and create or replace tool_descriptions.md under the cursor/output folder with the same concise tool descriptions for Cortex Agent configuration.
```

## 3. Generate Orchestration Instructions

Copy the prompt below and paste it into the Cursor chat.

```cursor
@snowflake_agent_best_practices.md @Snowflake_Cortex_Agent @Snowflake_Cortex_Analyst @Snowflake_Cortex_Search

Generate crisp, specific orchestration instructions following Snowflake best practices and update housekeeping.sql; also save them to orchestration_instructions.md:

CONTEXT:
- Available tools: Cortex Analyst [yaml/semantic_model.yaml], Cortex Search [Allows users to query Snowflake query history], and [Snowflake Official Documentation as a Cortex Knowledge Base service]
- Business domain: ["Administrators and Users for Snowflake"]
- User personas: ["Analysts will check query attribution and cost as well as Snowflake official documentation"]
- Critical user journeys: [Typical step-by-step reasoning logic the agent should follow]
- Business processes: [Specific business logic for how the agent should perform, select tools, coordinate, route, and make decisions]
- Data access: [Do not access private data if detected]

REQUIREMENTS:
- OVERALL: Parallelize as many tool calls as possible for latency optimization.
- Include concrete examples and sample questions for each tool category.
- Provide specific step-by-step instructions for multi-tool scenarios.
- Handle edge cases with concrete fallback strategies.
- Include business context and domain-specific logic.
- Generate specific business rules and decision trees.
- Include tool-specific usage patterns with examples.
- Add parallel execution patterns for complex queries.
- Include data access controls and filtering requirements.
- Update ONLY the "orchestration" and "sample_questions" columns in cortex_agents.sql; do not modify other columns.

ORCHESTRATION FORMAT:
1. Use "For [question type] questions: Use [Tool Name]" format.
2. Include 2–3 sample questions for each tool category.
3. Provide specific step-by-step instructions.
4. Handle edge cases with concrete fallback strategies.
5. Include business context and domain-specific rules.
6. Add parallel execution patterns.
7. Include data access and filtering guidelines.

OUTPUT: Update ONLY the "orchestration" and "sample_questions" columns in components/cortex_agents/housekeeping.sql and create orchestration_instructions.md under the cursor/output folder with crisp, specific orchestration instructions that follow Snowflake best practices.
```

## 4. Generate Response Instructions

Copy the prompt below and paste it into the Cursor chat.

```cursor
@snowflake_agent_best_practices.md @Snowflake_Cortex_Agent

Generate crisp, specific response instructions following Snowflake best practices and update housekeeping.sql; also save them to response_instructions.md:

CONTEXT:
- Business domain: ["Administrators and Users for Snowflake"]
- User personas: ["Analysts will check query attribution and cost as well as Snowflake official documentation"]
- Communication style: [professional]
- Business terminology: [Data specialist]
- Data access: [Do not access private data if detected]

REQUIREMENTS:
- Include concrete formatting instructions (e.g., "Show in table format", "Format dates as YYYY-MM-DD").
- Provide specific edge case handling (multiple results, no results, ambiguous queries).
- Include business context and domain-specific terminology.
- Add specific error handling and fallback strategies.
- Generate style guidelines and communication standards.
- Include data access warnings and scope limitations.
- Add specific formatting rules for different data types.
- Include business context integration requirements.
- Add performance optimization guidelines.
- Update ONLY the "response" column in cortex_agents.sql.

RESPONSE FORMAT:
1. Start with specific tone and style guidelines.
2. Include concrete formatting instructions.
3. Provide specific edge case handling.
4. Include business context and domain-specific terminology.
5. Add specific error handling and fallback strategies.
6. Include data access warnings and disclaimers.
7. Add performance optimization guidelines.

OUTPUT: Update ONLY the "response" column in components/cortex_agents/housekeeping.sql and create response_instructions.md under the cursor/output folder with crisp, specific response instructions that follow Snowflake best practices.
```

## 5. Generate Testing Strategy (Optional)

Copy the prompt below and paste it into the Cursor chat:

```cursor
@snowflake_agent_best_practices.md @Snowflake_Cortex_Agent

Generate a testing strategy following Snowflake best practices and save it to testing_strategy.md:

CONTEXT:
- Business domain: ["Administrators and Users for Snowflake"]
- User personas: ["Analysts will check query attribution and cost as well as Snowflake official documentation"]
- Critical user journeys: [Typical step-by-step reasoning logic the agent should follow]
- Business processes: [Specific business logic for how the agent should perform, select tools, coordinate, route, and make decisions]
- Data access: [Do not access private data if detected]

REQUIREMENTS:
- Test scenarios including in-scope, out-of-scope, and edge cases.
- Business best practices and workflow automation.
- Scope limitations and alternative responses.
- Data access guidelines and gap handling.
- Include 50–100 specific test questions covering all scenarios.

TESTING FORMAT:
1. In-scope test questions (30–40 questions).
2. Out-of-scope test questions (10–15 questions).
3. Edge case scenarios (10–15 questions).
4. Business workflow validation questions (10–15 questions).
5. Error handling and fallback scenarios (5–10 questions).

OUTPUT: Create testing_strategy.md under the cursor/output folder with a comprehensive testing strategy that follows Snowflake best practices.
```

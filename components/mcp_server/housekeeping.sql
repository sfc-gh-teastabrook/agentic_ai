--!jinja
USE ROLE TECHUP25_RL;
SET NAME = 'TECHUP25.{{env}}AGENTIC_AI.HOUSEKEEPING_MCP_SERVER';
CREATE OR REPLACE MCP SERVER IDENTIFIER($NAME) FROM SPECIFICATION
$$
tools:
  - name: "Snowflake Housekeeping Cortex Search Service"
    identifier: "TECHUP25.{{env}}AGENTIC_AI.QUERY_HISTORY_SEARCH_SERVICE"
    type: "CORTEX_SEARCH_SERVICE_QUERY"
    description: "A tool that performs keyword and vector search over Snowflake query history."
    title: "Snowflake Housekeeping Cortex Search Service"

  - name: "Snowflake Housekeeping Cortex Documentation"
    identifier: "SNOWFLAKE_DOCUMENTATION.SHARED.CKE_SNOWFLAKE_DOCS_SERVICE"
    type: "CORTEX_SEARCH_SERVICE_QUERY"
    description: "A tool that performs keyword and vector search over Snowflake documentation."
    title: "Snowflake Housekeeping Cortex Documentation"
$$;

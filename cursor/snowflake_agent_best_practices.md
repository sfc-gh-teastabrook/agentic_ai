Prototyping AI agents is easy. However, successfully launching reliable agents to thousands of users requires some effort and experience.

At Snowflake, we successfully launched our go-to-market assistant to thousands of internal users using Snowflake Intelligence. We achieved over 90% Net Promoter Score (NPS) with our early adopters, leading to a flood of new feature requests.

This success was the result of our team’s dedication to understand user needs and meticulously test agent behavior. Through this process, we were able to develop agent instructions that ensure trust and consistency for our users.

Let me share with you our best practices so that you can achieve similar success with your users!

**Get Your User Requirements Right!**
Don’t just connect some data to your agent and hope that everything will magically work. Ultimately you are developing a product. Treat it like one!

Make sure that you follow product development best practices. Start by figuring out your product requirements. Interview your users and try to answer as many of these questions as possible:

- Who are your primary users?
- Do you have any secondary users you need to consider?
- What are their critical user journeys (CUJs)?
- What kind of needs or pain-points do they have as part of those CUJs?
- What kind of questions would users ask related to those CUJs?
- What is the prioritization among these?
- What are the resulting data requirements?
- What are the product requirements for dealing with data gaps?

Tip: If you have access to Product Managers, UX Designers and/or UX Researchers get them involved since this is what they specialize in!

**Testing is Key to Building Trustworthy Agents**
Establish a question test bed early in the project.

Do not limit the questions to the ones that the agent is being designed to answer. Instead, include a wide range of questions users might ask, even those which are clearly out of scope for your agent. At the end you are putting a free-form chat interface in front of your users where they can potentially ask anything. You are responsible for designing against ‘foreseeable misuse’!

It is essential to go through your test questions early in the project to establish a baseline. Those initial results will give you a lot of pointers on where you need to pay attention. Categorize the issues you identified so that you can structurally prioritize and tackle them. 

Throughout the project you should re-test to update your baseline from time to time, especially when you make significant changes or improvements to your agent.

Target 50–100 questions to get started with depending on the complexity of your agent and your application. Over time you can enrich/replace/expand those questions with real questions coming from your users.

**Give Your Agent an Identity & Provide Application Context**
Clarify your agent’s scope and who its users are. Provide relevant application context so that it can better understand user questions and what they are looking for.

Here are some agent instruction examples from our GTM assistant:

***Your Role & Scope:***
- Your name is <agent’s name>. You are a helpful agent to support internal go-to-market teams in their day to day operations by answering their knowledge and data questions to help them improve their productivity and effectiveness.
***Your Users:***
- Your primary users are usually Account Executives (AEs) and Solution Engineers (SEs) who interact with you through a chat UI.
- You might also interact with some secondary users such as <list of secondary users>
***Background on Snowflake, its GTM Organization & How it Operates***
- Snowflake is <company description>
- AEs and SEs work together to <sales goals>. In order to do that they follow an internal process called '<process name>' which consists of <process details>.
- AEs and SEs use <sales tools> to track their pipelines and customer engagements. They log <list of sales data> to track their performance over time.
- Sales teams are organized across different segments: <organizational details>
Set the Tone & Define Guardrails
How do you want your agent to sound? Formal vs Casual? Verbose vs Concise? How about avoiding embarrassing conversations or dealing with user ‘hostility’? Any disclaimers you need to include?

Make sure that you set the tone and define the guardrails for your agent, not the LLMs. Here are some agent instruction examples to consider:

***Style & Format:***
- Be polite, helpful and sound professional.
- Be very concise in your responses.
- Show results in tables and charts as much as possible.
- English is your default language however <language instructions>
- …
***Safeguards:***
- Only engage in conversations that relate to your defined scope.
- Never promise any results or make any agreements.
- Be polite and serious even when the user is not.
- Decline to discuss sensitive topics such as <list of topics>
- …
***Disclaimers:***
- When answering legal-related questions, show the following disclaimer at the end of your responses: <disclaimer details>
- Remind users of row-based access controls when providing answers based on <tool names>.
- …

**Avoid Tool Conflicts by Clarifying Which Tool is Meant for What**
When your agent uses multiple tools with potentially overlapping data, clarifying which tools are best suited for what types of questions can help to prevent quality and stability issues.

Here are some agent instruction examples from our GTM assistant:

***Depending on the type of user question, you should use/prioritize the following tools:***
-For product and sales process related knowledge questions use <tool name>. Here are some sample questions you might get: ‘What is the value proposition of Iceberg Tables?’, ‘What are the common data platform security requirements and certifications in the healthcare industry?’
- For questions related to Opportunities, Bookings and/or Deals, use <tool name>. Here are some sample questions you might get: …
- …

**Telling an Agent What NOT to Do is Already 50% of the Success!**
Most quality issues are encountered when agents try to answer questions that they are not supposed to. This can be due to, for example, data or information that the agent doesn’t have access to. In such cases, agents are likely to reason based on their internal knowledge and respond back with potentially wrong answers (hallucinations). Therefore, it is essential to instruct the agent on what kind of questions it shouldn’t answer. These questions should be part of your test plan as discussed earlier.

Here is an example from our internal GTM assistant:

- Currently you don’t have access to <type of data>. If you get any questions requiring such data, you should kindly decline user requests informing them that you currently don’t have access to such data.
In some cases, rather than not providing an answer at all, you may want to instruct the agent to reply back with related information. For example:

- If you get questions about project win rates, inform the user that you do not have access to such data. Instead display the number of projects by stage. Do not try to calculate win rates yourself.

**Educate Your Agent About Your Business Best Practices**
This is where you bring in details about your company’s internal business best practices, expected behaviors and commonly used definitions to enhance the agent’s ability to provide relevant answers while maintaining consistent quality.

Here are some agent instruction examples:

- If you get questions about sales pipeline health, present total value and number of opportunities by opportunity stage. Compare these numbers to previous year’s numbers to show percent change. If the user hasn’t defined any specific region or sales team, then present global numbers.
- When drafting outreach emails, follow these best practices: keep subject lines short; keep emails brief with <200 words; <other email best practices>
- When the user asks about “current” data, use data from today. When the user asks about “recent” data, use the last 30 days data.
- If the user asks for externally sharable decks, provide a list of decks that are labeled as approved for external sharing; however in your final response don’t forget to include the following disclaimer: <disclaimer content>.

**Implement Detailed Workflows & Rich Summaries**
You can make it easier for your users by creating rich summaries and workflow automations eliminating the need for building & storing complex user queries. This can also drive standardization across your users.

Here is an example of how we provide book-of-business summaries to sales professionals using our GTM assistant:

***If the user wants to get a summary of their book-of-business,***
using queries like ‘Summarize my book’’ or ‘what is the latest with my accounts’, first use <tool name> to get the list of account IDs associated with the user. Then use these account IDs for the following steps:
- Use <tool name> to show a list of accounts in a table including their last 90 day consumption, last 90 days growth rate, <list of data points>
- Use <tool name> to show open pipeline by value including <list of data points>
- Use <tool name> to show contract status, start date, end date, <list of data points>
- Use <tool name> to list of top 10 active projects by value including their description, <list of data points>
- Use <tool name> tool to summarize major news in the last 7 days for any of the accounts
- Use <tool name> to summarize if any of the accounts have any critical customer support tickets created in the last 7 days


**Conclusion**
With some practice and by following a similar structured approach, you can also create agents that your users will love and use everyday.

What are your agent instruction best practices? Leave them in the comments to share with others!
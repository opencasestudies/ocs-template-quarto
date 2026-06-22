-- auto-add-ai-disclaimer.lua
function Div(el)
  if el.classes:includes("ai_box") then

    -- Margin note (as Markdown) (no leading spaces so it will format during rendering)

    local md = [[
**AI chatbot use Disclaimer:**

* Follow any guidelines or policies for permitted AI use and disclosure as specified by your team, institution, funding organization, or publisher.
* Keep track of the models you use (including versions) and be transparent about AI use in your work.
* Never provide sensitive patient or student data to a public AI chatbot. Passwords, credentials, API keys, unpublished manuscripts or grants, and other proporietary code or internal documents should also not be provided to a public AI chatbot. 
* Be specific in your prompts and ask the chatbot to help you understand code, instead of simply providing it. Do not include AI-generated code in production, analysis, or reporting without first reviewing, testing, and understanding it.
* Exercise caution in testing and using AI-generated code that installs packages, accessess or modifies files or data, uses credentials, or sends information over the internet.
* Chatbots may produce inaccurate, out-of-date, incomplete, or unnecessarily complicated information. All responses should be treated as unverified until checked critically. Always validate the existence and relevance of suggested citations or packages, test and simplify generated code or functions, and validate factual information using reliable sources.
* Recognize that you may need to iteratively improve your prompt to reach the desired output.
* The confidence of a chatbot does not indicate if its responses are correct. They may also agree with you when you are wrong.
* Asking a chatbot the same question more than once (even with the same prompt!) can result in different answers, so be sure to document what you can for the sake of reproducibility.
     ]]

    -- Parse Markdown into Pandoc AST blocks
    local blocks = pandoc.read(md).blocks

    -- Create the margin note block
    local margin = pandoc.Div(
      blocks,
      pandoc.Attr("", {"column-margin"})
    )

    -- Return the original block *followed by* the margin block
    return { el, margin }
  end
end

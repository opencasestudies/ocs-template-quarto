-- auto-add-ai-disclaimer.lua
function Div(el)
  if el.classes:includes("ai_box") then

    -- Margin note (as Markdown)

    local md = [[
      **AI chatbot use Disclaimer:**

      * Never provide sensitive data to an AI chatbot
      * Provide clear context about your question and why you are asking
      * Be ready to iterate your prompt
      * Chatbots often make mistakes so be sure to carefully consider their responses, test code / validate when possible
      * Asking a chatbot the same question more than once (even with the same prompt!) can result in different answers, so keep that in mind for reproducibility considerations
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

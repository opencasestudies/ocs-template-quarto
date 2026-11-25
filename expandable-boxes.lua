-- expandable_boxes.lua
local box_info = {
  ["troubleshooting"] = {
    icon = "assets/box_images/wrench.png",
    title = "Troubleshooting"
  },

  ["decision-point"] = {
    icon = "assets/box_images/path.png",
    title = "Decision Point"
  },

  ["ai-considerations"] = {
    icon = "assets/box_images/ai.png",
    title = "AI use considerations"
  },

  ["reproducibility"] = {
    icon = "assets/box_images/reproducibility.png",
    title = "Reproducibility considerations"
  },

}

function Div(el)

  for class_name, info in pairs(box_info) do

    if el.classes:includes(class_name) then

      local blocks = {}

      local is_open = el.classes:includes("open")

      local details_tag
      
      if is_open then
        details_tag = string.format(
          '<details class="%s expandable-box" open>',
          class_name
        )
      else
        details_tag = string.format(
          '<details class="%s expandable-box">',
          class_name
        )
      end
      
      table.insert(
        blocks,
        pandoc.RawBlock(
          "html",
          details_tag
        )
      )

      table.insert(
        blocks,
        pandoc.RawBlock(
          "html",
          '<summary><img src="' ..
            info.icon ..
            '" class="expandable-box-icon"> ' ..
            info.title ..
            '</summary>'
        )
      )

      table.insert(
        blocks,
        pandoc.RawBlock(
          "html",
          '<div class="expandable-box-content">'
        )
      )
      
      for _, block in ipairs(el.content) do
        table.insert(blocks, block)
      end
      
      table.insert(
        blocks,
        pandoc.RawBlock(
          "html",
          '</div>'
        )
      )
      
      table.insert(
        blocks,
        pandoc.RawBlock(
          "html",
          '</details>'
        )
      )
      
      if class_name == "ai-considerations" then

        local md = [[
**AI Use Disclaimer:**

* Follow any relevant required guidelines/policies for AI use.
<details> <summary>Examples</summary> Your team or lab, institution, funding organization, or publisher. These requirements should take precedence over our suggestions. </details>

* Check AI responses critically, as they may be inaccurate, out-of-date, incomplete, or unnecessarily complicated.
  <details> <summary>Examples</summary> 
 
  * Always validate the existence and relevance of suggested citations or packages.
  * Review, test, possibly simplify, and work to understand generated code or functions.
  * Validate factual information using reliable sources.
  * Exercise extra caution with code in certain instances: code that installs packages, accesses or modifies files or data, uses credentials, or sends information over the internet.
  </details>
    
* [Disclose](https://aiattribution.github.io/) your AI use (including model and versions).


* Never provide sensitive data to a public AI tool. <details><summary>Examples</summary> Patient or student data, passwords, credentials, API keys, unpublished manuscripts or grants, and other proprietary code or internal documents.</details> 
* Be specific in your prompts and ask the AI tool to help you understand the code.
* The confidence of an AI tool does not indicate if its responses are correct. They may also agree with you when you are wrong.
* AI may respond differently to the same repeated prompt. Be sure to document what you can for the sake of reproducibility.
* Recognize that you may need to iteratively improve your prompt to reach the desired output.
     ]]
      
        local disclaimer_blocks = pandoc.read(md).blocks
      
        local margin = pandoc.Div(
          disclaimer_blocks,
          pandoc.Attr("", {"column-margin", "ai-disclaimer"})
        )
      
        table.insert(blocks, margin)
      
      end
      
      return blocks

    end

  end

end

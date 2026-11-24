-- expandable_boxes.lua
local box_info = {
  ["troubleshooting"] = {
    icon = "assets/box_images/wrench.png",
    title = "Troubleshooting"
  },

  ["decision-point"] = {
    icon = "assets/box_images/path.png",
    title = "Decision Point"
  }
}

function Div(el)

  for class_name, info in pairs(box_info) do

    if el.classes:includes(class_name) then

      local blocks = {}

      table.insert(
        blocks,
        pandoc.RawBlock(
          "html",
          string.format(
            '<details class="%s expandable-box">',
            class_name
          )
        )
      )

      table.insert(
        blocks,
        pandoc.RawBlock(
          "html",
          string.format(
            '<summary>%s %s</summary>',
            info.icon,
            info.title
          )
        )
      )

      for _, block in ipairs(el.content) do
        table.insert(blocks, block)
      end

      table.insert(
        blocks,
        pandoc.RawBlock(
          "html",
          '</details>'
        )
      )

      return blocks

    end

  end

end

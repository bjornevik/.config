local has_mc, mc = pcall(require, "multicursor-nvim")
if not has_mc then
  return
end
local set = vim.keymap.set

mc.setup()

-- Add or skip adding a  new cursor by matching the word/selection
set("v", "<leader>n", function()
  mc.matchAddCursor(1)
end)
set("v", "<leader>N", function()
  mc.matchAddCursor(-1)
end)
set("v", "<leader>s", function()
  mc.matchSkipCursor(1)
end)
set("v", "<leader>S", function()
  mc.matchSkipCursor(-1)
end)

-- Add all matches in the document
set("v", "<leader>A", mc.matchAllAddCursors)

-- Rotate the main cursor
set("v", "<right>", mc.nextCursor)
set("v", "<left>", mc.prevCursor)

-- Delete the main cursor
set("v", "<leader>x", mc.deleteCursor)

set("n", "<esc>", function()
  if not mc.cursorsEnabled() then
    mc.enableCursors()
  elseif mc.hasCursors() then
    mc.clearCursors()
  else
    -- Default <esc> handler
  end
end)

-- Align cursor columns
set("v", "<leader>a", mc.alignCursors)

-- Append/insert for each line of visual selections
set("v", "I", mc.insertVisual)
set("v", "A", mc.appendVisual)

-- Rotate visual selection contents
set("v", "<leader>t", function()
  mc.transposeCursors(1)
end)
set("v", "<leader>T", function()
  mc.transposeCursors(-1)
end)

-- Jumplist support
set("v", "<c-i>", mc.jumpForward)
set("v", "<c-o>", mc.jumpBackward)

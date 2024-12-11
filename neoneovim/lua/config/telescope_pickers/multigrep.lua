local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local config = require "telescope.config".values
local sorters = require "telescope.sorters"

local M = {}

-- Stolen (and slightly modified) from Advent of Neovim december 10th:
-- https://www.youtube.com/watch?v=xdXE1tOT-qg
local live_multigrep = function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()

	local finder = finders.new_async_job {
		command_generator = function(prompt)
			if not prompt or prompt == "" then
				return nil
			end

			local pieces = vim.split(prompt, "  ") -- Two spaces
			local args = { "rg" }               -- RipGrep
			if pieces[1] then
				table.insert(args, "-e")          -- "rg --help" -> "-e defines pattern to search for"
				table.insert(args, pieces[1])
			end

			if pieces[2] then
				table.insert(args, "-g") -- "-glob", i.e. filetype
				table.insert(args, pieces[2])
			end

			-- vim.tbl_flatten{} is deprecated use vim.iter{}:flatten():totable()
			return vim.iter {
				args,
				-- extra ripgrep flags to make it play nice with telescope
				{ "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }
			}:flatten():totable()
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd
	}

	pickers.new(opts, {
		debounce = 100,
		prompt_title = "Live MultiGrep",
		finder = finder,
		previewer = config.grep_previewer(opts),
		sorter = sorters.empty()
	}):find()
end

--- Live MultiGrep (with filetypes!)
-- Allows you to grep for a string (smart-case) while restricting for filetypes or paths by separating your grep from the glob with two spaces "  "
--
-- For instance:
-- `opts  **/plugins/**` will search for all instances of `opts` under the `plugins`-directory.
-- `fetchuser  *.tsx` will search for all instances of `fetchuser` in `.tsx` files.
-- `writer  **/client/**/*.go` will search for all instances of `writer` in `.go` files under the `client`-directory
M.multi_grep = function()
	live_multigrep()
end

return M

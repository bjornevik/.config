return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		dependencies = {
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons"
		},
		opts = function()
			local actions = require("telescope.actions")
			local sorters = require("telescope.sorters")
			local previewers = require("telescope.previewers")

			return {
				defaults = {
					prompt_prefix = "  ",
					color_devicones = true,
					path_display = { "truncate" },
					layout_config = {
						horizontal = {
							preview_width = 0.55,
							results_width = 0.8,
						},
						preview_cutoff = 120,
					},
					file_sorter = sorters.get_fuzzy_file,
					generic_sorter = sorters.get_generic_fuzzy_sorter,
					file_ignore_patterns = {
						"undodir/.*",
						"node_modules/.*",
						".git/.*",
						".dart_tool/.*",
						"debug/.*",
						"target/.*",
						"_build/.*",
					},
					-- TODO: Figure out if I want these previewers
					file_previewer = previewers.vim_buffer_cat.new,
					grep_previewer = previewers.vim_buffer_vimgrep.new,
					qflist_previewer = previewers.vim_buffer_qflist.new,
					mappings = {
						i = {
							["<C-x>"] = false,
							["<C-q>"] = actions.send_to_qflist,
							["<C-h>"] = "which_key",
						},
					},
					preview = {
						treesitter = false,
					},
				},
				pickers = {
					buffers = {
						theme = "dropdown",
						mappings = {
							i = {
								["<C-x>"] = "delete_buffer",
							},
						},
					},
					find_files = {
						hidden = true,
					},
					live_grep = {
						hidden = true,
					},
					current_buffer_fuzzy_find = {
						theme = "ivy"
					}
				},
				extensions = {
					fzf = {}
				}
			}
		end,
		keys = function()
			local builtin = require("telescope.builtin")
			return {
				{ "<leader>ff", builtin.find_files,                noremap = true, desc = "(f)ind (f)iles" },
				{ "<leader>tb", builtin.buffers,                   noremap = true, desc = "(t)elescope (b)uffers" },
				{ "<leader>o",  builtin.buffers,                   noremap = true, desc = "(o)pen buffers" },
				{ "<leader>fs", builtin.live_grep,                 noremap = true, desc = "(f)ind (s)tring" },
				{ "<leader>bf", builtin.current_buffer_fuzzy_find, noremap = true, desc = "(b)uffer (f)fuzzy find" },
				{ "<leader>fh", builtin.help_tags,                 noremap = true, desc = "(f)ind (h)elp" },
			}
		end,
		init = function()
			-- Need to load `fzf` somewhere after setup
			require("telescope").load_extension("fzf")

			-- autocmd to provide additional keymaps on `LspAttach`
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end

					local builtin = require("telescope.builtin")
					---@disagnostic disable-next-line: missing-parameter
					if client.supports_method('textDocument/documentSymbol') then
						vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols,
							{ noremap = true, desc = "(d)ocument (s)ymbols" })
					end
				end
			})
		end
	},
}

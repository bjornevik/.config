---@type vim.lsp.Config
return {
	name = "vue_ls",
	cmd = { "vue-language-server", "--stdio" },
	filetypes = { "vue" },
	root_markers = {
		"tsconfig.json",
		"jsconfig.json",
		"package.json",
		".git",
	},
	on_init = function(client)
		-- bridge TypeScript requests from vue_ls → vtsls
		client.handlers["tsserver/request"] = function(_, result, context)
			local ts_clients = vim.lsp.get_clients {
				bufnr = context.bufnr,
				name = "vtsls",
			}
			if #ts_clients == 0 then
				vim.notify("vue_ls: no vtsls client found; Vue TS features disabled", vim.log.levels.ERROR)
				return
			end

			local ts_client = ts_clients[1]
			local param = unpack(result)
			local id, command, payload = unpack(param)

			ts_client:exec_cmd({
				title = "vue_request_forward",
				command = "typescript.tsserverRequest",
				arguments = { command, payload },
			}, { bufnr = context.bufnr }, function(_, r)
				local response = r and r.body
				local response_data = { { id, response } }
				client:notify("tsserver/response", response_data)
			end)
		end
	end,
}

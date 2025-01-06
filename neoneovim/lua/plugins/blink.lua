return {
	"Saghen/blink.cmp",
	enabled = true,
	version = "v0.*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = true,
			},
			menu = {
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
				},
			},
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.deafult" },
}

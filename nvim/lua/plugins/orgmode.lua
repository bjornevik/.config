return {
	{
		"nvim-orgmode/orgmode",
		enabled = true,
		event = "VeryLazy",
		ft = { "org" },
		opts = {
			org_agenda_files = "~/Projects/bjornevik/orgfiles/**/*",
			org_default_notes_file = "~/Projects/bjornevik/orgfiles/refile.org",
		},
	},
}

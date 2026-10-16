return {
	"xheisenbugx/org.nvim",
	main = "org",
	lazy = false, -- startup cost is tiny: only :Org and a few global keymaps
	opts = {
		org_directory = "~/org",
		agenda_files = { "~/org/**/*.org" },
		default_notes_file = "~/org/refile.org",
	},
}

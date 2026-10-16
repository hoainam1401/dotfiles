return {
	"Mirsmog/real-icons.nvim",
	build = ":RealIconsInstallPack material",
	opts = {
		pack = "material",
		integrations = {
			telescope = true,
		},
	},
}

-- cds is not installed by default as a filetype :(
vim.filetype.add({
	extension = {
		cds = "cds",
	},
})

require("base").setup({
	"cds-lsp",
	"jdtls",
}, {
	cds_lsp = {
		cmd = { "cds-lsp", "--stdio" },
		filetypes = { "cds" },
	},
	jdtls = {},
})

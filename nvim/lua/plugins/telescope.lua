return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim", "jonarrien/telescope-cmdline.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      require("telescope").setup()
      require("telescope").load_extension("cmdline")

      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find in files" })
      vim.api.nvim_set_keymap("n", "Q", ":Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
      vim.api.nvim_set_keymap(
        "n",
        "<leader><leader>",
        ":Telescope cmdline<CR>",
        { noremap = true, desc = "Cmdline" }
      )
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}

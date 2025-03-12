return {
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set("n", "<leader>on", ":Copilot enable<CR>", { desc = "Enable Copilot" })
      vim.keymap.set("n", "<leader>of", ":Copilot disable<CR>", { desc = "Disable Copilot" })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { "<leader>zc", ":CopilotChat<CR>",         mode = "n", desc = "Chat with Copilot" },
      { "<leader>ze", ":CopilotChatExplain<CR>",  mode = "v", desc = "Explain Code" },
      { "<leader>zr", ":CopilotChatReview<CR>",   mode = "v", desc = "Review Code" },
      { "<leader>zf", ":CopilotChatFix<CR>",      mode = "v", desc = "Fix Code Issues" },
      { "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" },
      { "<leader>zd", ":CopilotChatDocs<CR>",     mode = "v", desc = "Generate Docs" },
      { "<leader>zt", ":CopilotChatTests<CR>",    mode = "v", desc = "Generate Tests" },
      { "<leader>zm", ":CopilotChatCommit<CR>",   mode = "n", desc = "Generate Commit Message" },
      { "<leader>zs", ":CopilotChatCommit<CR>",   mode = "v", desc = "Generate Commit for Selection" },
      { "<leader>co", ":CopilotChatOpen<CR>",     mode = "n", desc = "Open Chat Window" },
      { "<leader>cc", ":CopilotChatClose<CR>",    mode = "n", desc = "Close Chat Window" },
      { "<leader>ct", ":CopilotChatToggle<CR>",   mode = "n", desc = "Toggle Chat Window" },
      { "<leader>cs", ":CopilotChatStop<CR>",     mode = "n", desc = "Stop Output" },
      { "<leader>cr", ":CopilotChatReset<CR>",    mode = "n", desc = "Reset Chat Window" },
      { "<leader>cs", ":CopilotChatSave<CR>",     mode = "n", desc = "Save Chat History" },
      { "<leader>cl", ":CopilotChatLoad<CR>",     mode = "n", desc = "Load Chat History" },
      { "<leader>cm", ":CopilotChatModels<CR>",   mode = "n", desc = "Select Model" },
      { "<leader>cg", ":CopilotChatAgents<CR>",   mode = "n", desc = "Select Agent" },
      { "<leader>cp", ":CopilotChatPrompt<CR>",   mode = "n", desc = "Use Prompt Template" },
    },
  },
}

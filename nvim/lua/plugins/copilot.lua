return {
  {
    "github/copilot.vim",
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
    },
    -- See Commands section for default commands:
    --  :CopilotChat <input>? : Open chat with optional input
    --  :CopilotChatToggle : Toggle chat window
    --  :CopilotChatClose : Close chat window
    --  :CopilotChatOpen : Open chat window
    --  :CopilotChatStop : Stop current output
    --  CopilotChatReset : Reset chat window
    --  CopilotChatSave <name>? : Save chat history
    --  CopilotChatLoad <name>? : Load chat history
    --  CopilotChatModels : View/select available CopilotChatModels
    --  CopilotChatAgents : View/select available CopilotChatAgents
    --  CopilotChat<PromptName> : Use specific prompt template
  },
}

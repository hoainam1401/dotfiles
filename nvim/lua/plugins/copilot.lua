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

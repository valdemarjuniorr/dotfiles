return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = true, -- Force enable suggestions
      auto_trigger = true,
      hide_during_completion = false,
      keymap = {
        accept = "<Tab>", -- Add a key to accept suggestions
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = true,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        window = {
          width = 0.4,
        },
      }
    end,
    keys = {
      -- Window management
      {
        "<leader>ac",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle Chat",
        mode = { "n", "v" },
      },
      {
        "<leader>ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Reset Chat",
        mode = { "n", "v" },
      },
      {
        "<leader>as",
        function()
          return require("CopilotChat").stop()
        end,
        desc = "Stop Generation",
        mode = { "n", "v" },
      },

      -- Quick chat with input prompt
      {
        "<leader>aq",
        function()
          vim.ui.input({
            prompt = "Quick Chat: ",
          }, function(input)
            if input and input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Quick Chat",
        mode = { "n", "v" },
      },

      -- Prompt selection
      {
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Select Prompt",
        mode = { "n", "v" },
      },

      -- Model selection
      {
        "<leader>am",
        function()
          require("CopilotChat").select_model()
        end,
        desc = "Select Model",
        mode = { "n", "v" },
      },

      -- Common coding tasks
      {
        "<leader>ae",
        function()
          require("CopilotChat").ask("Explain this code")
        end,
        desc = "Explain Code",
        mode = { "n", "v" },
      },
      {
        "<leader>af",
        function()
          require("CopilotChat").ask("Fix this code")
        end,
        desc = "Fix Code",
        mode = { "n", "v" },
      },
      {
        "<leader>at",
        function()
          require("CopilotChat").ask("Generate tests for this code")
        end,
        desc = "Generate Tests",
        mode = { "n", "v" },
      },
      {
        "<leader>ar",
        function()
          require("CopilotChat").ask("Refactor this code")
        end,
        desc = "Refactor Code",
        mode = { "n", "v" },
      },
      {
        "<leader>ad",
        function()
          require("CopilotChat").ask("Document this code")
        end,
        desc = "Document Code",
        mode = { "n", "v" },
      },
      {
        "<leader>ao",
        function()
          require("CopilotChat").ask("Optimize this code")
        end,
        desc = "Optimize Code",
        mode = { "n", "v" },
      },
      {
        "<leader>ab",
        function()
          require("CopilotChat").ask("Find bugs in this code")
        end,
        desc = "Find Bugs",
        mode = { "n", "v" },
      },

      -- Custom contextual requests
      {
        "<leader>ai",
        function()
          vim.ui.input({
            prompt = "Improve code by: ",
          }, function(input)
            if input and input ~= "" then
              require("CopilotChat").ask("Improve this code by " .. input)
            end
          end)
        end,
        desc = "Improve Code",
        mode = { "n", "v" },
      },

      -- For actual chat buffer
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
  },
}

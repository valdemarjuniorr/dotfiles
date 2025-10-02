return {
  -- Core Debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-jdtls", -- Java LSP with DAP support
      "nvim-neotest/nvim-nio", -- REQUIRED for dap-ui
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      local java_debug_path =
        "~/.local/share/nvim/debuggers/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.2.jar"
      -- Java DAP adapter (from java-debug)
      dap.adapters.java = {
        type = "server",
        host = "127.0.0.1",
        port = 5005,
        executable = {
          command = "java",
          args = {
            "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005",
            "-jar",
            vim.fn.glob(java_debug_path),
          },
        },
      }
      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Attach to remote JVM",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }

      dapui.setup()
      require("nvim-dap-virtual-text").setup({})

      -- Auto open/close dap-ui
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Debug: Conditional Breakpoint" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
      vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
    end,
  },

  -- Java LSP integration (JDTLS)
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local jdtls = require("jdtls")
      local home = os.getenv("HOME")
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

      local config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          home .. "/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher.jar",
          "-configuration",
          home .. "/.local/share/nvim/lsp_servers/jdtls/config_linux",
          "-data",
          workspace_dir,
        },
        root_dir = require("jdtls.setup").find_root({ "gradle.build", "pom.xml", ".git" }),
      }

      jdtls.start_or_attach(config)
    end,
  },
}

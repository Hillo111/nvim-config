require("noice").setup({
    cmdline = {
      enabled=true,
      format = {
        filter = { pattern = "^:%s*!", icon = "👉", lang = "bash" },
      }
    },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  views = {
    cmdline_popup = {
      position = {
        col = "50%",
        row = "50%"
      },
    },
  },
  routes = {
  }
})

-- custom keymap function to toggle noice
vim.g.noice_enabled = true

function _G.toggle_noice()
  if vim.g.noice_enabled then
    require("noice").disable()
    vim.g.noice_enabled = false
  else
    require("noice").enable()
    vim.g.noice_enabled = true
  end
end

vim.api.nvim_set_keymap("n", "<leader>nt", "<cmd>lua toggle_noice()<CR>", { noremap = true, silent = true })



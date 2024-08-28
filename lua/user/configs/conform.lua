require("conform").setup({
   formatters_by_ft = {
      javascript = { "prettierd", stop_after_first = true },
   },
   formatters = {
      prettierd = {
         exe = "prettierd",
         args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
         stdin = true,
      }
   }
})

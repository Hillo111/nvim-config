local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {'clangd', 'pyright', 'rubocop', 'lua_ls', 'bashls', 'phpactor', 'cssls', 'jdtls'}
local navbuddy = require('nvim-navbuddy')

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup{
		capabilities = capabilities,
		on_attach=function(client, bufnr)
		  navbuddy.attach(client, bufnr)
		end,
		handlers={
		  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border=border})
		}
	}
end
lspconfig.html.setup{
	capabilities = capabilities,
	filetypes = { "html", "templ", "html.erb", "php" }
}
lspconfig.pyright.setup{
  capabilities = capabilities,
  settings = {
	python = {
	  analysis = {
		autoSearchPaths = true,
		useLibraryCodeForTypes = true,
		diagnosticMode = "openFilesOnly",
	  },
	  pythonPath = "/users/stas.gannutin/test/bin/python3",
	}
  }
}

lspconfig.java_language_server.setup{
  capabilities = capabilities,
  cmd = { '/Users/stas.gannutin/java-language-server/dist/lang_server_mac.sh' },

}
lspconfig.rust_analyzer.setup{
	capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

local function rename_file()
    local source_file, target_file

    vim.ui.input({
        prompt = "Source : ",
        completion = "file",
        default = vim.api.nvim_buf_get_name(0)
    },
        function(input)
            source_file = input
        end
    )
    vim.ui.input({
        prompt = "Target : ",
        completion = "file",
        default = source_file
    },
        function(input)
            target_file = input
        end
    )

    local params = {
        command = "_typescript.applyRenameFile",
        arguments = {
            {
                sourceUri = source_file,
                targetUri = target_file,
            },
        },
        title = ""
    }

    vim.lsp.util.rename(source_file, target_file)
    vim.lsp.buf.execute_command(params)
end


lspconfig.tsserver.setup {
  capabilities = capabilities,
    commands = {
        RenameFile = {
            rename_file,
            description = "Rename File"
        },
    }
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gdt', "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.api.nvim_create_user_command('Rename', 'lua vim.lsp.buf.rename()', {})
    vim.api.nvim_create_user_command('Reformat', 'lua vim.lsp.buf.format()', {})
  end,
})

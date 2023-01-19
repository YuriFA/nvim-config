local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- BUFFERS
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
keymap("n", "<leader>b", ":Buffers<CR>", { noremap = true, silent = true })
keymap("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })
keymap("n", "<Space>1", ":BufferLineGoToBuffer 1<CR>", { silent = true })
keymap("n", "<Space>2", ":BufferLineGoToBuffer 2<CR>", { silent = true })
keymap("n", "<Space>3", ":BufferLineGoToBuffer 3<CR>", { silent = true })
keymap("n", "<Space>4", ":BufferLineGoToBuffer 4<CR>", { silent = true })
keymap("n", "<Space>5", ":BufferLineGoToBuffer 5<CR>", { silent = true })
keymap("n", "<Space>6", ":BufferLineGoToBuffer 6<CR>", { silent = true })
keymap("n", "<Space>7", ":BufferLineGoToBuffer 7<CR>", { silent = true })
keymap("n", "<Space>8", ":BufferLineGoToBuffer 8<CR>", { silent = true })
keymap("n", "<Space>9", ":BufferLineGoToBuffer 9<CR>", { silent = true })

-- WINDOWS
keymap("n", "<C-k>", ":wincmd k<CR>", { noremap = true, silent = true })
keymap("n", "<C-j>", ":wincmd j<CR>", { noremap = true, silent = true })
keymap("n", "<C-h>", ":wincmd h<CR>", { noremap = true, silent = true })
keymap("n", "<C-l>", ":wincmd l<CR>", { noremap = true, silent = true })

-- FIND FILES
keymap("n", "<leader>fw", ":Rg<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fc", ":Commits<CR>", { noremap = true, silent = true })

-- TELESCOPE
-- keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>fa", ":Telescope live_grep debounce=100<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>fa", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- NVIM TREE
keymap("n", "<C-n>", ":NvimTreeToggle <CR>", { noremap = true, silent = true })

-- -- COC
-- vim.cmd "source ~/.config/nvim/keymappings-coc.vim"

-- keymap("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
-- keymap("n", "<leader>F", ":call CocActionAsync('format')<CR>", { silent = true, noremap = true })
-- -- keymap("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true, noremap = true })
-- -- keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
-- -- keymap("i", "<TAB>", "coc#pum#visible() ? 'coc#pum#next(1)' : '<TAB>'", { noremap = true, silent = true, expr = true })
-- -- keymap("i", "<S-TAB>", "coc#pum#visible() ? 'coc#pum#prev(1)' : '<C-h>'", { noremap = true, expr = true })
-- -- keymap("i", "<CR>", "coc#pum#visible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", { silent = true, expr = true, noremap = true })
-- -- keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})
-- keymap("n", "<leader>ac", ":Telescope coc code_actions<CR>", { silent = true })
-- keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
-- keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
-- keymap("n", "gd", ":Telescope coc definitions<CR>", { noremap = true, silent = true })
-- keymap("n", "gy", ":Telescope coc type_definitions<CR>", { noremap = true, silent = true })
-- keymap("n", "gr", ":Telescope coc references<CR>", { noremap = true, silent = true })
-- keymap("n", "gi", ":Telescope coc implementations<CR>", { noremap = true, silent = true })

-- LSP
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
-- keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
-- keymap("n", "<Leader>ac", "<cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
-- keymap("v", "<leader>F", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

local nmap = function(mode, keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	vim.keymap.set(mode, keys, func, { desc = desc })
end

nmap("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
nmap("n", "<leader>ac", vim.lsp.buf.code_action, "[C]ode [A]ction")

nmap("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
nmap("n", "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
nmap("n", "gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
nmap("n", "<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
nmap("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
nmap("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

-- See `:help K` for why this keymap
nmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
nmap("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

-- Lesser used LSP functionality
nmap("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
nmap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
nmap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
nmap("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, "[W]orkspace [L]ist Folders")

nmap("n", "<leader>F", vim.lsp.buf.format)

nmap("n", "[g", vim.diagnostic.goto_prev)
nmap("n", "]g", vim.diagnostic.goto_next)

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- BUFFERS
-- map("n", "<Tab>", ":BufferNext<CR>", { noremap = true, silent = true })
keymap("n", "<Tab>", ":bn<CR>", { noremap = true, silent = true })
-- keymap("n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":bp<CR>", { noremap = true, silent = true })
-- keymap("n", "<S-q>", ":BufferClose<CR>", { noremap = true, silent = true })
keymap("n", "<leader>b", ":Buffers<CR>", { noremap = true, silent = true })
keymap("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })
keymap("n", "<Space>1", ":BufferGoto 1<CR>", { silent = true })
keymap("n", "<Space>2", ":BufferGoto 2<CR>", { silent = true })
keymap("n", "<Space>3", ":BufferGoto 3<CR>", { silent = true })
keymap("n", "<Space>4", ":BufferGoto 4<CR>", { silent = true })
keymap("n", "<Space>5", ":BufferGoto 5<CR>", { silent = true })
keymap("n", "<Space>6", ":BufferGoto 6<CR>", { silent = true })
keymap("n", "<Space>7", ":BufferGoto 7<CR>", { silent = true })
keymap("n", "<Space>8", ":BufferGoto 8<CR>", { silent = true })
keymap("n", "<Space>9", ":BufferGoto 9<CR>", { silent = true })

-- WINDOWS
keymap("n", "<C-k>", ":wincmd k<CR>", { noremap = true, silent = true })
keymap("n", "<C-j>", ":wincmd j<CR>", { noremap = true, silent = true })
keymap("n", "<C-h>", ":wincmd h<CR>", { noremap = true, silent = true })
keymap("n", "<C-l>", ":wincmd l<CR>", { noremap = true, silent = true })

keymap("n", "<leader>fa", ":Rg<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>ff", ":Ag<CR>", { noremap = true, silent = true})
keymap("n", "<leader>fc", ":Commits<CR>", { noremap = true, silent = true })

-- NVIM TREE
keymap("n", "<C-n>", ":NvimTreeToggle <CR>", { noremap = true, silent = true })

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
-- keymap("v", "<leader>ac", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>ac", "<cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
keymap("v", "<leader>F", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fw", ":Telescope live_grep <CR>", { noremap = true, silent = true })

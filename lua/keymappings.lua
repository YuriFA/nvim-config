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
keymap("n", "<leader>fa", ":Rg<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fc", ":Commits<CR>", { noremap = true, silent = true })

-- TELESCOPE
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fw", ":Telescope live_grep <CR>", { noremap = true, silent = true })

-- NVIM TREE
keymap("n", "<C-n>", ":NvimTreeToggle <CR>", { noremap = true, silent = true })

-- COC
keymap("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
keymap("n", "<leader>F", ":call CocActionAsync('format')<CR>", { silent = true, noremap = true })
-- keymap("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true, noremap = true })
-- keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
-- keymap("i", "<TAB>", "coc#pum#visible() ? 'coc#pum#next(1)' : '<TAB>'", { noremap = true, silent = true, expr = true })
-- keymap("i", "<S-TAB>", "coc#pum#visible() ? 'coc#pum#prev(1)' : '<C-h>'", { noremap = true, expr = true })
-- keymap("i", "<CR>", "coc#pum#visible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", { silent = true, expr = true, noremap = true })
-- keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})
-- keymap("n", "<leader>ac", "<Plug>(coc-codeaction)", {})
-- keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
-- keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
-- keymap("n", "gd", "<Plug>(coc-definition)", { noremap = true, silent = true })
-- keymap("n", "gr", "<Plug>(coc-references)", { noremap = true, silent = true })
-- keymap("n", "gi", "<Plug>(coc-implementation)", { noremap = true, silent = true })

-- LSP
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
-- keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
-- keymap("v", "<leader>ac", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true })
-- keymap("n", "<Leader>ac", "<cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
-- keymap("v", "<leader>F", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
-- keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
-- keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
--

-- COC 
vim.cmd "source ~/.config/nvim/keymappings-coc.vim"

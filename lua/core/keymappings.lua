local M = {}

function M.setup()
	local keymap = vim.api.nvim_set_keymap

	keymap("n", "<leader>w", ":w<CR>", {
		noremap = true,
		silent = true,
	})

	-- BUFFERS
	keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<leader>b", ":Buffers<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<leader>q", ":bd<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<Space>1", ":BufferLineGoToBuffer 1<CR>", {
		silent = true,
	})
	keymap("n", "<Space>2", ":BufferLineGoToBuffer 2<CR>", {
		silent = true,
	})
	keymap("n", "<Space>3", ":BufferLineGoToBuffer 3<CR>", {
		silent = true,
	})
	keymap("n", "<Space>4", ":BufferLineGoToBuffer 4<CR>", {
		silent = true,
	})
	keymap("n", "<Space>5", ":BufferLineGoToBuffer 5<CR>", {
		silent = true,
	})
	keymap("n", "<Space>6", ":BufferLineGoToBuffer 6<CR>", {
		silent = true,
	})
	keymap("n", "<Space>7", ":BufferLineGoToBuffer 7<CR>", {
		silent = true,
	})
	keymap("n", "<Space>8", ":BufferLineGoToBuffer 8<CR>", {
		silent = true,
	})
	keymap("n", "<Space>9", ":BufferLineGoToBuffer 9<CR>", {
		silent = true,
	})

	-- WINDOWS
	keymap("n", "<C-k>", ":wincmd k<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<C-j>", ":wincmd j<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<C-h>", ":wincmd h<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<C-l>", ":wincmd l<CR>", {
		noremap = true,
		silent = true,
	})

	-- FIND FILES
	keymap("n", "<leader>fw", ":Rg<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<leader>fc", ":Commits<CR>", {
		noremap = true,
		silent = true,
	})

	-- TELESCOPE
	keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<leader>fa", ":Telescope live_grep debounce=500<CR>", {
		noremap = true,
		silent = true,
	})

	---@diagnostic disable-next-line: lowercase-global
	function grep_search_with_ignore()
		local search_dir = vim.fn.input("Enter the search directory: ")
		local ignored_subfolders = vim.fn.input("Enter the subfolders to ignore (separated by comma): ")
		local search_dirs = { search_dir }
		local ignore = {}

		for subfolder in string.gmatch(ignored_subfolders, "%S+") do
			ignore[subfolder] = true
		end

		require("telescope.builtin").live_grep({
			search_dirs = search_dirs,
			file_ignore_patterns = ignored_subfolders,
			ignore = ignore,
		})
	end

	-- Function to perform a new search with user-defined parameters
	---@diagnostic disable-next-line: lowercase-global
	function grep_search_with_ignore()
		-- Prompt for search directory
		local search_dir = vim.fn.input("Enter the search directory: ")

		if search_dir == "" then
			-- If user doesn't enter a search directory, exit function
			return
		end

		-- Prompt for ignored subfolders
		local ignored_subfolders = vim.fn.input("Enter the subfolders to ignore (separated by comma): ")

		-- Convert ignored subfolders to table and create ignore table
		local ignored_subfolders_table = vim.split(ignored_subfolders, ",", {
			plain = true,
		})
		local ignore = {}

		for _, subfolder in ipairs(ignored_subfolders_table) do
			ignore[subfolder] = true
		end

		-- Store last used search directory and ignored subfolders as variables
		vim.api.nvim_set_var("last_search_dir", search_dir)
		vim.api.nvim_set_var("last_ignored_subfolders", ignored_subfolders)

		-- Call live_grep with search directory and ignore table
		require("telescope.builtin").live_grep({
			search_dirs = { search_dir },
			file_ignore_patterns = ignored_subfolders_table,
			ignore = ignore,
		})
	end

	-- Function to perform a search with last entered parameters
	---@diagnostic disable-next-line: lowercase-global
	function grep_search_with_last_params()
		-- Get last used search directory and ignored subfolders from variables
		local last_search_dir = vim.api.nvim_get_var("last_search_dir")
		local last_ignored_subfolders = vim.api.nvim_get_var("last_ignored_subfolders")

		-- Call live_grep with last used search directory and ignored subfolders
		require("telescope.builtin").live_grep({
			search_dirs = { last_search_dir },
			file_ignore_patterns = vim.split(last_ignored_subfolders, ",", {
				plain = true,
			}),
			ignore = {},
		})
	end

	keymap("n", "<leader>fi", ":lua grep_search_with_ignore()<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<leader>fl", ":lua grep_search_with_last_params()<CR>", {
		noremap = true,
		silent = true,
	})

	keymap("n", "<leader>fd", ":Telescope dir live_grep<CR>", {
		noremap = true,
		silent = true,
	})
	-- keymap("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })

	-- NVIM TREE
	keymap("n", "<C-n>", ":NvimTreeToggle <CR>", {
		noremap = true,
		silent = true,
	})

	-- COC
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

	-- vim.cmd "source ~/.config/nvim/keymappings-coc.vim"

	-- LSP
	-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
	keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", {
		noremap = true,
		silent = true,
	})
	-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
	keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", {
		noremap = true,
		silent = true,
	})
	-- keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
	keymap("n", "gi", "<cmd>lua require'telescope.builtin'.lsp_implementations()<CR>", {
		noremap = true,
		silent = true,
	})
	-- keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
	keymap("n", "gy", "<cmd>lua require'telescope.builtin'.lsp_type_definitions()<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("v", "<leader>ac", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", {
		noremap = true,
		silent = true,
	})
	-- keymap("n", "<Leader>ac", "<cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>", { noremap = true, silent = true })
	keymap("n", "gI", ":TypescriptRenameFile<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "<leader>F", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("v", "<leader>F", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", {
		noremap = true,
		silent = true,
	})
	keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", {
		noremap = true,
		silent = true,
	})
end

return M

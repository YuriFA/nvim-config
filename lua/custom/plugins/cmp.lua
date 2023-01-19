local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		-- format = function(entry, vim_item)
		--   vim_item.kind = string.format("%s", vim_item.kind)
		--
		--   vim_item.menu = ({
		--     buffer = '[Buffer]',
		--     luasnip = '[Snip]',
		--     nvim_lsp = '[LSP]',
		--     nvim_lua = '[API]',
		--     path = '[Path]',
		--     rg = '[RG]',
		--   })[entry.source.name]
		--
		--   return vim_item
		-- end,
		fields = { "kind", "abbr", "menu" },
		format = function(entry, item)
			-- item.kind = string.format('%s', icons[item.kind])
			item.menu = ({
				buffer = "[Buffer]",
				luasnip = "[Snip]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[API]",
				path = "[Path]",
				rg = "[RG]",
			})[entry.source.name]
			return item
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
		{ name = "path" },
		{ name = "nvim_lua" },
	},
})

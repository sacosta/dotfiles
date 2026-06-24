return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	bigfile = { enabled = true },
	dashboard = { enabled = true },
	explorer = { enabled = false },
	indent = { enabled = true },
	input = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = false },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	indent = {
	  picker = {
		enabled=true,
		win = {
		  input = {
			keys = {
			  ["<a-s>"] = { "flash", mode = { "n", "i" } },
			  ["s"] = { "flash" },
			},
		  },
		},
		actions = {
		  flash = function(picker)
			require("flash").jump({
			  pattern = "^",
			  label = { after = { 0, 0 } },
			  search = {
				mode = "search",
				exclude = {
				  function(win)
					return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
				  end,
				},
			  },
			  action = function(match)
				local idx = picker.list:row2idx(match.pos[1])
				picker.list:_move(idx, true, true)
			  end,
			})
		  end,
		},
	  },
	  animate = {
		enabled = vim.fn.has("nvim-0.10") == 1,
		style = "out",
		easing = "linear",
		duration = {
		  step = 20, -- ms per step
		  total = 100, -- maximum duration
		},
	  }

	},
  },
}

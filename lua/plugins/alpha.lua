return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- PriUni ASCII header
			dashboard.section.header.val = {
				"PPPPPPPPPPPPPPPPP   RRRRRRRRRRRRRRRRR   IIIIIIIIIIUUUUUUUU     UUUUUUUUNNNNNNNN        NNNNNNNNIIIIIIIIII",
				"P::::::::::::::::P  R::::::::::::::::R  I::::::::IU::::::U     U::::::UN:::::::N       N::::::NI::::::::I",
				"P::::::PPPPPP:::::P R::::::RRRRRR:::::R I::::::::IU::::::U     U::::::UN::::::::N      N::::::NI::::::::I",
				"PP:::::P     P:::::PRR:::::R     R:::::RII::::::IIUU:::::U     U:::::UUN:::::::::N     N::::::NII::::::II",
				"  P::::P     P:::::P  R::::R     R:::::R  I::::I   U:::::U     U:::::U N::::::::::N    N::::::N  I::::I  ",
				"  P::::P     P:::::P  R::::R     R:::::R  I::::I   U:::::D     D:::::U N:::::::::::N   N::::::N  I::::I  ",
				"  P::::PPPPPP:::::P   R::::RRRRRR:::::R   I::::I   U:::::D     D:::::U N:::::::N::::N  N::::::N  I::::I  ",
				"  P:::::::::::::PP    R:::::::::::::RR    I::::I   U:::::D     D:::::U N::::::N N::::N N::::::N  I::::I  ",
				"  P::::PPPPPPPPP      R::::RRRRRR:::::R   I::::I   U:::::D     D:::::U N::::::N  N::::N:::::::N  I::::I  ",
				"  P::::P              R::::R     R:::::R  I::::I   U:::::D     D:::::U N::::::N   N:::::::::::N  I::::I  ",
				"  P::::P              R::::R     R:::::R  I::::I   U:::::D     D:::::U N::::::N    N::::::::::N  I::::I  ",
				"  P::::P              R::::R     R:::::R  I::::I   U::::::U   U::::::U N::::::N     N:::::::::N  I::::I  ",
				"PP::::::PP          RR:::::R     R:::::RII::::::II U:::::::UUU:::::::U N::::::N      N::::::::NII::::::II",
				"P::::::::P          R::::::R     R:::::RI::::::::I  UU:::::::::::::UU  N::::::N       N:::::::NI::::::::I",
				"P::::::::P          R::::::R     R:::::RI::::::::I    UU:::::::::UU    N::::::N        N::::::NI::::::::I",
				"PPPPPPPPPP          RRRRRRRR     RRRRRRRIIIIIIIIII      UUUUUUUUU      NNNNNNNN         NNNNNNNIIIIIIIIII",
			}

			-- Buttons
			dashboard.section.buttons.val = {
				dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
				dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
				dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
				dashboard.button("t", "  Find Text", ":Telescope live_grep <CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>"),
			}

			-- Footer
			dashboard.section.footer.val = "Time to Get Coding"

			-- No extra bars, just clean dashboard
			alpha.setup(dashboard.opts)
		end,
	},
}

return {
   "folke/zen-mode.nvim",
   opts = {
       plugins = {
           options = {
                enabled = true,
                ruler = true, -- disables the ruler text in the cmd line area
                showcmd = true, -- disables the command in the last line of the screen
                -- you may turn on/off statusline in zen mode by setting 'laststatus' 
                -- statusline will be shown only if 'laststatus' == 3
                laststatus = 0, -- turn off the statusline in zen mode
            },
            twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
            gitsigns = { enabled = false }, -- disables git signs
            tmux = { enabled = true }, -- disables the tmux statusline
            -- this will change the font size on kitty when in zen mode
            -- to make this work, you need to set the following kitty options:
            -- - allow_remote_control socket-only
            -- - listen_on unix:/tmp/kitty
            kitty = {
                enabled = false,
                font = "+4", -- font size increment
            },
            -- this will change the font size on alacritty when in zen mode
            -- requires  Alacritty Version 0.10.0 or higher
            -- uses `alacritty msg` subcommand to change font size
            alacritty = {
                enabled = false,
                font = "14", -- font size
            },
            -- this will change the font size on wezterm when in zen mode
            -- See alse also the Plugins/Wezterm section in this projects README
            wezterm = {
              enabled = false,
              -- can be either an absolute font size or the number of incremental steps
              font = "+4", -- (10% increase per step)
            },
        }
    }
} 


-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          -- Copy filename (basename, with extension)
          ['Y'] = function(state)
            local node = state.tree:get_node()
            local filename = node.name
            vim.fn.setreg('+', filename)
            vim.notify('Copied filename: ' .. filename, vim.log.levels.INFO)
          end,

          -- Copy basename (filename without extension)
          ['Yb'] = function(state)
            local node = state.tree:get_node()
            local filename = node.name
            local basename = filename:match '(.+)%..+$' or filename
            vim.fn.setreg('+', basename)
            vim.notify('Copied basename: ' .. basename, vim.log.levels.INFO)
          end,

          -- Copy absolute path
          ['Yp'] = function(state)
            local node = state.tree:get_node()
            local abspath = node.path
            vim.fn.setreg('+', abspath)
            vim.notify('Copied absolute path: ' .. abspath, vim.log.levels.INFO)
          end,
        },
      },
    },
  },
}

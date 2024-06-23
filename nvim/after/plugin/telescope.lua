local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', function()
    builtin.buffers({sort_lastused = true, ignore_current_buffer = true});
end)
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<C-y>'] = require('telescope.actions.layout').toggle_preview
      }
    },
    preview = {
      hide_on_startup = true -- hide previewer when picker starts
    }
  }
})

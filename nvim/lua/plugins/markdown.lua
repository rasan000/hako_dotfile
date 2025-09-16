return {
  {
    'dkarter/bullets.vim',
    ft = { 'markdown', 'text', 'gitcommit' },
    config = function()
      vim.g.bullets_enabled_file_types = {
        'markdown',
        'text',
        'gitcommit',
        'scratch'
      }

      vim.g.bullets_set_mappings = 1
    end,
  }
}

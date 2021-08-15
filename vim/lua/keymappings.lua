
local utils = require('utils')

local map = function(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

map { 'n', '<Leader>ff', ':Telescope find_files<cr>' }
map { 'n', '<Leader>fg', ':Telescope live_grep<cr>' }
map { 'n', '<Leader>fb', ':Telescope buffer<cr>' }
map { 'n', '<Leader>fh', ':Telescope help_tas<cr>' }

-- map { '', ';', ':' }

-- enable spell checking
map { '', '<Leader>s', ':setlocal spell! spelllang=en_us<cr>', noremap = false }

-- VSplit window
map { 'n', '<Leader>2', ':vsplit<CR>' }
map { 'n', '<Leader>1', ':only<CR>' }
-- go to the other window
map { 'n', '<Leader>w', '<C-w><C-w>' }
map { 'n', '<Leader>o', '<C-w><C-w>' }

map { '', '<Leader>l', ':ls<CR>:b ' }

-- close buffer without closing window
map { '', '<Leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', noremap = false }

-- delete buffer without closing pane
map { 'n', '<Leader>bd', ':Bd<cr>' }

-- bind K to grep word under cursor
-- map { 'n', 'K', ':grep! "\b<C-R><C-W>\b"<CR>:cw<CR>' }


-- strip all trailing whitespace in the current file
map { 'n', '<Leader>W', [[:%s/\s\+$//<cr>:let @/=''<CR>]] }

-- quickly edit .vimrc file
map { 'n', '<Leader>ev', '<C-w><C-v><C-l>:e $MYVIMRC<cr>' }

-- Disable highlight when <leader><cr> is pressed
-- but preserve cursor coloring
-- nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>
map { 'n', '<leader><cr>', ':noh|hi Cursor guibg=red<cr>', silent = true }

-- a smart <Tab> Key
-- When the autocomplete menu is visible navigate throught the list of results,
-- otherwise act like a regular <Tab>
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.smart_tab = function()
  if vim.fn.pumvisible() == 1 then
    return t'<C-n>'
  else
    return t'<Tab>'
  end
end

vim.api.nvim_set_keymap ( 'i', '<Tab>', 'v:lua.smart_tab()'
                        , {noremap = true, expr = true}
                        )

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
-- inoremap kk <esc>
utils.map('i', 'kk', '<Esc>')           -- kk to escape

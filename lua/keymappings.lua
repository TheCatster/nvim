local keymap = vim.keymap
local opt = vim.opt

-- Select the contents of the current line, excluding indentation.
keymap.set('n', 'vv', '^vg_')

-- Don't lose selection when shifting sidewards
keymap.set('x', '<', '<gv')
keymap.set('x', '>', '>gv')

-- Delete highlighted text and start insert mode
keymap.set("n", "c", "\"_c")

-- Quit from faster
keymap.set("", "<C-q>", ":confirm qall<CR>")

-- Save faster
keymap.set("n", "<leader>w", ":w<CR>", { remap = true })

-- Toggle spellcheck
keymap.set("", "<leader>o", ":setlocal spell! spelllang=en_us<CR>", { remap = true })

-- Keep search matches in the middle of the window.
keymap.set('n', 'n', 'nzzzv', { silent = true })
keymap.set('n', 'N', 'Nzzzv', { silent = true })

-- Center content
keymap.set("n", "*", "*zz", { silent = true })
keymap.set("n", "#", "#zz", { silent = true })
keymap.set("n", "g*", "g*zz", { silent = true })

-- Fuzzy search to open file
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- Better search
keymap.set("n", "S", ":%s//g<Left><Left>")
keymap.set("n", "?", "?\\v")
keymap.set("n", "/", "/\\v")
keymap.set("c", "%s/", "%sm/")

-- Same when jumping around
keymap.set('n', 'g;', 'g;zz')
keymap.set('n', 'g,', 'g,zz')

-- Bibliography help
keymap.set("", "<leader>b", ":vsp<space>$BIB<CR>", { remap = true })
keymap.set("", "<leader>r", ":vsp<space>$REFER<CR>", { remap = true })

-- Suspend neovim
keymap.set("i", "<C-f>", ":sus<CR>")
keymap.set("v", "<C-f>", ":sus<CR>")
keymap.set("n", "<C-f>", ":sus<CR>")

-- ; is more convenient
keymap.set("n", ";", ":")

-- Jump to beginning and end of line
keymap.set("", "H", "^")
keymap.set("", "L", "$")

-- Move by lines by default
keymap.set('', 'j', 'gj')
keymap.set('', 'k', 'gk')
keymap.set('', 'gj', 'j')
keymap.set('', 'gk', 'k')

-- Better navigation between windows
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- No arrow keys: force yourself to use the home row
keymap.set("n", "<up>", "<nop>")
keymap.set("n", "<down>", "<nop>")
keymap.set("i", "<up>", "<nop>")
keymap.set("i", "<down>", "<nop>")
keymap.set("i", "<left>", "<nop>")
keymap.set("i", "<right>", "<nop>")

-- Left and right can switch buffers
keymap.set("n", "<left>", ":bp<CR>")
keymap.set("n", "<right>", ":bp<CR>")

-- <leader><leader> toggles between buffers
keymap.set("n", "<leader><leader>", "<C-^>")

-- <leader>, shows/hides hidden characters
keymap.set("n", "<leader>,", ":set invlist<CR>")

-- <leader>q shows stats
keymap.set("n", "<leader>q", "g<C-g>")

-- Keymap for replacing up to next _ or -
keymap.set("", "<leader>m", "ct_")

-- Open new file adjacent to current file
keymap.set("n", "<leader>e", ":e <C-R>=expand(\"%:p:h\") . \"/\" <CR>")

-- I can type :help on my own, thanks.
keymap.set("", "<F1>", "<Esc>")
keymap.set("i", "<F1>", "<Esc>")

-- Sudo to write
keymap.set('c', 'w!!', 'w !sudo tee % >/dev/null')

-- Open files in directory of current file
keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>")
keymap.set('', '<leader>e', ':edit %%', { remap = true})

-- Find merge conflict markers
keymap.set('n', '<leader>cf', '<ESC>/\\v^[<=>]{7}( .*|$)<CR>', { silent = true })

-- Replace grep with ripgrep
if vim.fn.executable('rg') == 1 then opt.grepprg = "rg --vimgrep" end

-- Spell checking and automatic wrapping at the 72 chars to git commit message
vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'gitcommit',
  callback = function()
    cmd('setlocal spell textwidth=72')
  end,
  desc = 'Spell checking and automatic wrapping at the 72 chars to git commit message'
})

-- Rename current file
keymap.set('', '<leader>n', function()
  local old_name = fn.expand('%')
  local new_name = fn.input('New file name: ', vim.fn.expand('%'), 'file')

  if (new_name ~= '' and new_name ~= old_name) then
    cmd(':saveas '.. new_name)
    cmd(':silent !rm '.. old_name)
    cmd('redraw!')
  end
end)

vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("i", "JK", "<ESC>")
keymap.set("i", "jj", "<ESC>:w<CR>")
keymap.set("i", "JJ", "<ESC>:w<CR>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>]", ":tabn<CR>")
keymap.set("n", "<leader>[", ":tabp<CR>")

-- gitblame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>")
keymap.set("n", "<leader>gl", ":GitBlameOpenFileURL<CR>")

-- window resize
keymap.set("n", "<leader>rh", "<cmd>vertical resize -5<cr>")
keymap.set("n", "<leader>rl", "<cmd>vertical resize +5<cr>")
keymap.set("n", "<leader>rj", "<cmd>horizontal resize -5<cr>")
keymap.set("n", "<leader>rk", "<cmd>horizontal resize +5<cr>")

keymap.set("n", "<leader>c,", ":GitConflictListQf<CR>")
keymap.set("n", "<leader>cn", ":GitConflictNextConflict<CR>")
keymap.set("n", "<leader>cm", ":GitConflictPrevConflict<CR>")
keymap.set("n", "<leader>ch", ":GitConflictChooseOurs<CR>")
keymap.set("n", "<leader>cj", ":GitConflictChooseTheirs<CR>")
keymap.set("n", "<leader>ck", ":GitConflictChooseBoth<CR>")
keymap.set("n", "<leader>cl", ":GitConflictChooseNone<CR>")

keymap.set("n", "<leader>y", ':let @+ = expand("%")<CR>')
keymap.set("n", "<leader>Y", ':let @+ = expand("%:p")<CR>')

keymap.set("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")

-- Github keymaps
keymap.set("n", "<leader>p", ":Octo search is:pr is:open author:duchk226<CR>")
keymap.set("n", "<leader>P", ":Octo search is:pr is:closed author:duchk226<CR>")

keymap.set("n", "<leader>df", ":!rm %<CR>:bp<bar>sp<bar>bn<bar>bd<CR>")

vim.keymap.del("n", "<Space><Space>")

local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

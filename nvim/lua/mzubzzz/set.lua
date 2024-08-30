vim.opt.number = true -- turn on line numbers
vim.opt.relativenumber = true -- numbers to be relative
vim.opt.tabstop= 2
vim.opt.shiftwidth= 2
vim.opt.expandtab = true -- changes tabs to spaces
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff= 8
vim.opt.termguicolors = true -- enables termguicolors for color highlighting
vim.opt.background='dark'
vim.opt.ignorecase = true -- ignore case while searching
vim.opt.signcolumn= "yes" -- vim.opt.visible most left column
-- vim.opt.colorcolumn=150 -- vim.opt.visible line which marks N symbols line length
vim.opt.conceallevel = 2 -- conceals all quotes
vim.opt.concealcursor = 'c' -- to replace markdown representation of emphasize words. Doesnt conceal then cursor on the line
-- vim.opt.shell="/bin/bash\ -i" -- allows vim use system bash with all aliases (this is what it for)
vim.opt.list = true -- show all white space characters
vim.opt.showbreak='↪' -- sets up white space characters
vim.opt.listchars = { space = '·', tab = '->', eol = '↲', nbsp = '␣', trail = '•', extends = '⟩', precedes = '⟨' } -- sets up white space characters
vim.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


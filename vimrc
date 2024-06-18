set number " turn on line numbers
set number relativenumber " set numbers to be relative
set tabstop=4
set shiftwidth=4
set expandtab " changes tabs to spaces
set smartindent
set nohlsearch
set incsearch
set scrolloff=8
set termguicolors " enables termguicolors for color highlighting
set background=dark
set ignorecase " ignore case while searching
set signcolumn=yes " set visible most left column
" set colorcolumn=150 " set visible line which marks N symbols line length
set conceallevel=2 " conceals all quotes
set concealcursor=c " to replace markdown representation of emphasize words. Doesn't conceal then cursor on the line
set shell=/bin/bash\ -i " allows vim use system bash with all aliases (this is what it for)
set list " show all white space characters
set showbreak=↪ " sets up white space characters
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:· " sets up white space characters
set laststatus=2 " set status bar always visible
" set spell spelllang=en_us,ru_ru,de_de " enables spell check. COC Plugin does it
" much better
" Persistent undo
 if has("persistent_undo")
   let target_path = expand('~/.vim/undo')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif
    let &undodir=target_path
    set undofile " allows store undo history across buffers
set undolevels=1000
endif
" autocmd FileType typescriptreact set formatprg=prettier-eslint\ --stdin
" autocmd BufWritePre *.tsx :normal gggqG

autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 " set 2 symbols for indent in *.ts files
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 " set 2 spaces for indent in *.tsx files
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 " set 2 spaces for indent in *.jsx files
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 " set 2 spaces for indent in *.js files
autocmd FileType css setlocal shiftwidth=2 tabstop=2 " set 2 spaces for indent in *.css files

packadd! matchit " allows use % on html/xml tags

let g:vim_json_syntax_conceal = 0 " disable quotes concealing in json (doesn't work)
let g:indentLine_setConceal = 0
let g:vim_markdown_folding_disabled = 1 " disable folding in markdown
let g:vimspector_enable_mappings = 'HUMAN' " sets up default mapping in debug
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-java',
      \ 'coc-go',
      \ 'coc-angular',
      \ 'coc-eslint',
      \ 'coc-spell-checker',
      \ 'coc-cspell-dicts',
      \ 'coc-prettier'
  \ ]

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf first plugin
Plug 'junegunn/fzf.vim' " fzf second plugin
Plug 'gruvbox-community/gruvbox' " gruvbox color scheme
Plug 'uiiaoo/java-syntax.vim' " Java highlight
Plug 'puremourning/vimspector' " debugger
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'} " COC
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " go documentation access
Plug 'godlygeek/tabular' " align tabular symbols (:Tab /{pattern})
Plug 'preservim/vim-markdown' " markdown highlighting
Plug 'tpope/vim-fugitive' " git plugin
Plug 'mbbill/undotree'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " hex colors highlighting
Plug 'yaegassy/coc-volar', { 'do': 'yarn install --frozen-lockfile' }
Plug 'yaegassy/coc-volar-tools', { 'do': 'yarn install --frozen-lockfile' }
if (has("termguicolors"))
    set termguicolors
endif
call plug#end()

" let g:gruvbox_guisp_fallback = "bg" " by default gruvbox doesn't highlight incorrectly spelled words (this fixes this)
colorscheme gruvbox
highlight clear SignColumn " must be after color scheme. Removes color from most left sign column
hi ColorColumn ctermbg=darkgrey guibg=darkgrey " changes color of the colorcolumn
hi SpecialKey ctermfg=gray guifg=grey70 " makes whitespace characters a bit dimmer

" Remapping

let mapleader = ","
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Autoplace closing bracket
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
" select completion choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation. (for COC plugin)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Vim-go
" mapping :GoDoc
autocmd FileType go nmap <Leader>i <Plug>(go-doc)
let g:go_auto_type_info = 1 "auto invokes :GoInfo
" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
" Standart Vim explorer remaping
nnoremap <leader>e :Explore<CR>

" Vispector (Debugger)
" sets mapping for exit command
nnoremap <leader>de :VimspectorReset<CR>

" Autoformat on saving. Doesn't work. Looks like no uses eslint --fix
"set formatexpr=
"autocmd FileType typescriptreact set formatexpr= formatprg=prettier-eslint\ --stdin\ --parser\ typescript\ --single-quote\ true
"autocmd FileType typescript set formatexpr= formatprg=prettier-eslint\ --stdin \ --parser\ typescript\ --single-quote\ true
"autocmd BufWritePre *.tsx,*.ts :normal gggqG

set number " turn on line numbers
set number relativenumber " set numbers to be relative
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set smartindent
set incsearch
set scrolloff=8
set signcolumn=yes " set visible most left column
set colorcolumn=150 " set visible line which marks N symbols line lenght
"java proper syntax highlighting
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
call plug#end()

colorscheme gruvbox
highlight clear SignColumn " must be after colorscheme. Removes color from most left sign column
hi ColorColumn ctermbg=darkgrey guibg=darkgrey " changes color of the colorcolumn

" remapings

" GoTo code navigation. (for Coc plugin)
 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)

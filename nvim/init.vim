
" Setup basic settings.
set number
set nowrap
"set termguicolors
set number
set laststatus=2

let g:airline_theme='challenger_deep'
let g:airline_theme='twofirewatch'
"let g:airline_theme='ayu'
let g:airline_powerline_fonts = 1

" Bootstrap Plug
call plug#begin('C:\tools\vim-plugged')
 
 Plug 'rakr/vim-one'
 Plug 'mhinz/vim-startify'
 Plug 'equalsraf/neovim-gui-shim'
 Plug 'henrynewcomer/vim-theme-papaya'
 Plug 'KKPMW/sacredforest-vim'
 Plug 'flazz/vim-colorschemes'
 Plug 'vim-scripts/Color-Scheme-Explorer'
 Plug 'chriskempson/base16-vim'
 Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'vimwiki/vimwiki'
 Plug 'rust-lang/rust.vim'
 Plug 'majutsushi/tagbar'
 Plug 'bfrg/vim-cpp-modern'
 Plug 'rakr/vim-two-firewatch'
 Plug 'jacoborus/tender.vim'
" Plug 'mhartington/ocean-next'
 Plug 'marcopaganini/termschool-vim-theme' 
 Plug 'rakr/vim-togglebg'
 Plug 'ayu-theme/ayu-vim' 
call plug#end()


"set background=dark
"colorscheme one
"colorscheme two-firewatch
"colorscheme challenger_deep
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu

map \ev :edit $MYVIMRC<CR>
map \sv :so $MYVIMRC<CR>

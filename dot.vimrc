syntax on
syntax enable
filetype plugin on
filetype indent on
""colorscheme evening
set nocompatible
set number
set ruler
set nowrap
set autoindent
set smartindent
set si
set et
set smarttab
set shiftwidth=4
set hidden
set showbreak=>
set textwidth=79
highlight Folded ctermbg=none ctermfg=white
set fillchars=fold:\ 
""set foldtext=getline(v:foldstart)
set foldtext=v:foldstart

let c_gnu=1
let c_no_bracket_error=1
let objc_syntax_for_h=1
syntax enable

""set statusline=%F%m%r%h%w\ FORMAT:%{&ff}\ Type:%Y]\ ascii:\%03.3b\ hex:\%02.2B\ %04l,%04v [%p%%]\ LEN:%L 
set statusline=%F%m%r%h%w\ FORMAT:%{&ff}\ ascii:\%03.3b\ hex:\%02.2B\ %l,%v\ %p%%
set laststatus=2

""au BufWinLeave * mkview
""au BufWinEnter * silent loadview

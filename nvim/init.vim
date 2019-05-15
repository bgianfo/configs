
" Setup basic settings.
filetype plugin on
set number
set nowrap
set number
set laststatus=2
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowritebackup
set guioptions=

" Searching
set hlsearch
set incsearch
set showmatch
set matchtime=1
set gdefault
set smartcase
set ignorecase
set clipboard+=unnamedplus
" Notes setting
"
let g:vimwiki_map_prefix = '<Leader>vw'
let g:vimwiki_dir_link = 'index'
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 2
let g:vimwiki_folding='custom'
let g:vimwiki_auto_export = 0
let g:vimwiki_auto_toc = 1
let g:vimwiki_auto_tags =  0
let g:vimwiki_ext = '.md'
let g:vimwiki_syntax = 'markdown'
let g:vimwiki_diary_rel_path = 'daily/'
let g:vimwiki_diary_index = 'index'
let g:vimwiki_diary_header = 'Daily Notes'
let g:vimwiki_nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh'}

" Setup machine specific configuration
"
if $COMPUTERNAME == "LMAO"
  let g:vimwiki_path = 'C:\notes\'
elseif $COMPUTERNAME == "WTF"
  let g:vimwiki_path = 'C:\notes\'
elseif $COMPUTERNAME == "BJG"
  let g:vimwiki_path = 'F:\notes\'
endif

if exists('+termguicolors')
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if has('gui_running')
  set guifont=UbuntuMono\ NF:h12
  if has('nvim')
  else
  endif
endif

" Bootstrap Plug
call plug#begin('C:\tools\vim-plugged')
 
 " Themes 
 "
 " Plug 'vim-scripts/Color-Scheme-Explorer'
 " Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
 " Plug 'flazz/vim-colorschemes'
 Plug 'ayu-theme/ayu-vim' 
 Plug 'joshdick/onedark.vim'
 Plug 'KeitaNakamura/neodark.vim'
 Plug 'sonph/onehalf', {'rtp': 'vim/'}
 Plug 'chriskempson/base16-vim'
 Plug 'wmvanvliet/vim-blackboard'
 Plug 'rakr/vim-one'
 Plug 'NLKNguyen/papercolor-theme'

 " Extensions
 "
 Plug 'mhinz/vim-startify'
 Plug 'ryanoasis/vim-devicons'
 Plug 'vim-airline/vim-airline'
 Plug 'tpope/vim-fugitive'
 Plug 'vimwiki/vimwiki'
 Plug 'equalsraf/neovim-gui-shim'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'scrooloose/nerdtree'
 Plug 'rust-lang/rust.vim'
 Plug 'majutsushi/tagbar'
 Plug 'bfrg/vim-cpp-modern'
 Plug 'mhinz/vim-signify'
 Plug 'luochen1990/rainbow'
 Plug 'junegunn/goyo.vim'
 Plug 'junegunn/limelight.vim'
 Plug 'rhysd/committia.vim'
 Plug 'wahidrahim/resize-font'
 Plug 'vim-scripts/zoom.vim'
 Plug 'jreybert/vimagit'
 Plug 'PProvost/vim-ps1'
 Plug 'yegappan/greplace'
 Plug 'rhysd/git-messenger.vim'
call plug#end()

set background=dark
"let g:airline_theme='challenger_deep'
"let g:airline_theme='twofirewatch'
"let g:airline_theme='ayu'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#whitespace#checks = [ ]

"let ayucolor='dark'  " for dark version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="light"  " for light version of theme
"let g:airline_theme='ayu_mirage'
"colorscheme ayu

"let g:airline_theme='onedark'
"colorscheme onedark

let g:airline_theme='neodark'
let g:neodark#terminal_transparent = 1
let g:neodark#use_256coor = 1
let g:neodark#background = '#1E1F29'
colorscheme neodark

map \ev :edit $MYVIMRC<CR>
map \sv :so $MYVIMRC<CR>

" Configure vim-startify
"
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" Airline configuration
" See: https://github.com/vim-airline/vim-airline/issues/272
"
let g:airline_detect_spell = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
function! AirlineInit()
    let g:airline_section_z = airline#section#create(['%3p%%', ' %c']) 
endfunction
autocmd VimEnter * call AirlineInit()


" VimWiki Integration Commnads
"
function! OpenTodayNote()
  exec "VimwikiMakeDiaryNote "
endfunction

function! OpenYesterdayNote()
  exec "VimwikiMakeYesterdayDiaryNote "
endfunction

function! OpenTomorrowNote()
  exec "VimwikiMakeTomorrowDiaryNote "
endfunction

function! OpenLastNote()
 let last_note = resolve(split(globpath(g:vimwiki_path . '\daily\.', '*-*-*.md'), '\n')[-1])
 exec "vs " . last_note
endfunction

function! OpenListAllNotes()
  exec "VimwikiDiaryIndex "
endfunction

function! OpenWikiIndex()
  exec "VimwikiIndex "
endfunction

" Command integrations, only define them once so we
" can source the config over and over again in the
" same session.
"
if exists('g:my_hacks_loaded')
   " No-op
else
	let g:my_hacks_loaded = 1

	" Mappings for my note functions
	"
	command ListNotes call OpenListAllNotes()
	command TodayNote call OpenTodayNote()
	command YesterdayNote call OpenYesterdayNote()
	command TomorrowNote call OpenTomorrowNote()
	command LastNote call OpenLastNote()
	command Index call OpenWikiIndex()

	" Function to set common settings for log files.
	"
	function SetErrorLogOptions()
		set filetype=log
		set nospell
	endfunction

	function SetCsharpOptions()
		set noexpandtab
		set filetype=cs
	endfunction

endif

" Config ripgrep
"
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" How many lines before/max current line to start syntax highlighting parsing
"
augroup vimrc
 autocmd!
 autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END

" Show cursor line only on focused window.
"
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight

" Setup file type mappings
"
au! BufRead,BufNewFile *errorlog* call SetErrorLogOptions()
au! BufRead,BufNewFile *ERRORLOG* call SetErrorLogOptions()
au! BufRead,BufNewFile *.log set nospell
au! BufRead,BufNewFile *.src set filetype=cpp
au! BufRead,BufNewFile source* set filetype=make
au! BufRead,BufNewFile *.inc set filetype=make
au! BufRead,BufNewFile makefile* set filetype=make
au! BufRead,BufNewFile *.props set filetype=xml
au! BufRead,BufNewFile *.proj set filetype=xml
au! BufRead,BufNewFile *.targets set filetype=xml
au! BufRead,BufNewFile *.xe set filetype=xml
au! BufRead,BufNewFile *.inl set filetype=cpp
au! BufRead,BufNewFile *.dbmanifest set filetype=dosini
au! BufRead,BufNewFile *.manifest set filetype=dosini
au! BufRead,BufNewFile *.ycc set filetype=yacc
au! BufRead,BufNewFile *.g set filetype=antlr3
au! BufRead,BufnewFile *.tc set filetype=xml
au! BufRead,BufnewFile *.tt call SetCsharpOptions()
au! BufRead,BufnewFile *.xaml set filetype=xml
au! BufRead,BufnewFile *.cs call SetCsharpOptions()

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

au BufNewFile,BufRead *.aml     setf html

""set statusline=%F%m%r%h%w\ FORMAT:%{&ff}\ Type:%Y]\ ascii:\%03.3b\ hex:\%02.2B\ %04l,%04v [%p%%]\ LEN:%L 
""set statusline=%F%m%r%h%w\ FORMAT:%{&ff}\ ascii:\%03.3b\ hex:\%02.2B\ %l,%v\ %p%%
""set laststatus=2

""au BufWinLeave * mkview
""au BufWinEnter * silent loadview
set laststatus=2
if version >= 700
      au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
      au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse

""set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.F\ORMAT:%{&ff}\ ascii:\%03.3b\ hex:\%02.2B\ %l,%v\ %p%%\%P\*%=%{CurTime()}
""set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
set rulerformat=%15(%c%V\ %p%%%)
""set rulerformat=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}

fun! FileTime()
  let ext=tolower(expand("%:e"))
  let fname=tolower(expand('%<'))
  let filename=fname . '.' . ext
  let msg=""
  let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
  return msg
endf

fun! CurTime()
  let ftime=""
  let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
  return ftime
endf


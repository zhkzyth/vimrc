"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost my_configs.vim source %

set nocompatible  "no vim compatible


" screen reference
"=======
set shortmess=atI   " no help message
set nu

syntax on           " highlight syntax
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

"make the background transparent
hi Normal ctermbg=NONE ctermfg=252 
"set t_Co=256
colorscheme ir_black

set ruler  
set showcmd

set novisualbell
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%] "what to show in statusline
set laststatus=2   " always show the statusline

"folding settings
set foldnestmax=5 "deepest fold is 10 levels
set foldlevel=1
set foldenable      "[nofoldenable,..]
set foldmethod=indent   "[indent,manual,....]
""save the fold state.
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" help manual in chinese if possible
if version >= 603
   set helplang=cn
   set encoding=utf-8
endif

"set the encode proto
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,shift-jis
set termencoding=utf-8
set encoding=utf-8

" Allows pattern matching with special characters
set magic

" Edit pref
"========== 
"code completeopt
set completeopt=preview,menu 

"share the clipboard
set clipboard=unnamed
"not work as expect,so i use pbcopy&paste
map <F4> :w !pbcopy<CR><CR>
map <F6> :r !pbpaste<CR><CR>
"never back up
set nobackup
"auto save
set autowrite
" remove the error prompt   
set noeb
" confirm if the editting file has not been saved
set confirm
" not auto change the working directories
" default should be off
set noautochdir
"opens a file with the current working dir
map <leader>e :e <C-R>=expand("%:p:h")."/"<CR>
" how much do you need log down? 
set history=1000

"tab pref
set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    "Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   "Indent by 4 spaces when pressing <TAB>
"for indent
set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable""""""


"search pref
"==========
set ignorecase smartcase
set hlsearch
set incsearch
"whether search global by default
set gdefault
"save the project setting,so you can come back as normal..
set viminfo+=!
" dont cut the line if we get such keyword
set iskeyword+=_,$,@,%,#,-

" can use the mouse in our buffers
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set report=1
" fill chars in splited windows
set fillchars=vert:\ ,stl:\ ,stlnc:\
" highlight the match
set showmatch
" how long should we highlight the match unit 0.1s
set matchtime=1

" indent
set smartindent
set autoindent

"auto complete bracket
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
"according to the file type to add <CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
   if getline('.')[col('.') - 1] == a:char
      return "\<Right>"
   else
      return a:char
   endif
endfunction


" copy all content in the file
map! <C-A> <Esc>ggVGY

"Quick save command
noremap <C-Z> :update<CR>

"easier moving of code blocks
vnoremap > >gv
vnoremap < <gv


"Plugin user pref
"================

" CTags pre
let Tlist_Auto_Open=0
let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
let Tlist_Sort_Type = "name"  
let Tlist_Use_Right_Window = 1
let Tlist_Compart_Format = 1
let Tlist_Exist_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Enable_Fold_Column = 1
let Tlist_Show_One_File=1

map <F2> :Tlist<cr>

"BufExplorer
map <C-x> :BufExplorer<cr>

"TODO order in recent,but not name
map <F1> :NERDTreeToggle<cr>

"TODO modify nerdcommenter and make it more suitable.
autocmd VimEnter * map <leader>/ <leader>c<space>

"TODO dev a plugin for content shared btw vim instances...

"TODO add more api here

"TODO shortcuts for the filefinder
"nmap <leader>f :FF<CR>

"TODO for the fucking awesome command-T 
let g:CommandTMaxCachedDirectories=0
let g:CommandTMatchWindowAtTop=0

"TODO shortcut for lucyfilefinder

" combine acp and snipmate
"let g:acp_behaviorSnipmateLength=1

" TODO for the tagbar   
map <F3> :TagbarToggle<cr>

" resize current buffer by +/- 5 
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize +5<cr>
nnoremap <S-up> :resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>

"differ the behaviour of {}
autocmd FileType html inoremap {{ {{<space><space><space>}}<LEFT><lEFT><LEFT><LEFT>
autocmd FileType html inoremap {% {%<space><space><space>%}<LEFT><LEFT><LEFT><LEFT>

"TODO correct the filetype
au FileType javascript setl foldmethod=indent

"
autocmd FileType python map <buffer> <F4> :call Flake8()<CR>

"NERDTree options
let NERDTreeIgnore = ['\.pyc$','\.o$']

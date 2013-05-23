"vimrc file for python/js/much more....
"author :zhkzyth@gmail.com

"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost my_configs.vim source %

set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  


" 显示相关  
"=======
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"winpos 5 5          " 设定窗口位置  
"set lines=40 columns=155    " 设定窗口大小  
set nu              " 显示行号  
set go=             " 不要图形按钮  

"set guifont=Courier_New:h10:cANSI   " 设置字体  
syntax on           " 语法高亮  
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
"set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  



set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set novisualbell    " 不要闪烁(不明白)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2   " 启动显示状态行(1),总是显示状态行(2)  

"folding settings
set foldnestmax=10      "deepest fold is 10 levels
set foldlevel=1
set foldenable      "[nofoldenable,..]
set foldmethod=indent   "[indent,manual,....]
""save the fold state.
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" 显示中文帮助
if version >= 603
   set helplang=cn
   set encoding=utf-8
endif

"字体 
"if (has("gui_running")) 
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
"endif 

"set the encode proto
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏


" Edit pref
"========== 
"代码补全 
set completeopt=preview,menu 

"共享剪贴板  
set clipboard=unnamed
"not work as expect,so i use pbcopy&paste
map <F7> :.w !pbcopy<CR><CR>
map <F6> :r !pbpaste<CR>

"从不备份  
set nobackup
""禁止生成临时文件

""自动保存
set autowrite
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" not auto change the working directories
" default should be off
" set noautochdir
"opens a file with the current working dir
map <leader>e :e <C-R>=expand("%:p:h")."/"<CR>


"tab pref
"========
set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=3    "Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=3   "Indent by 4 spaces when pressing <TAB>

set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable""""""

" 历史记录数
set history=1000



"search pref
"==========
"搜索忽略大小写
set ignorecase smartcase
"搜索逐字符高亮
set hlsearch
set incsearch
"whether search global by default
"set gdefault
"save the project setting,so you can come back as normal..
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 为C程序提供自动缩进
set smartindent
" 自动缩进
set autoindent

"自动补全 括号匹配
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap { {<CR>}<ESC>O  
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

"differ the behaviour of {}
"for Django
autocmd FileType html inoremap {{ {{<space><space><space>}}<LEFT><lEFT><LEFT><LEFT>
autocmd FileType html inoremap {% {%<space><space><space>%}<LEFT><LEFT><LEFT><LEFT>

"键盘命令
"=========
"nmap <leader>f :find<cr>
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
" map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"比较文件  
"nnoremap <C-F2> :vert diffsplit 
"新建标签  
"map <M-F2> :tabnew<CR>  

"better copy & paste
"set pastetoggle=<F2>
"set clipboard=unamed

"Quick save command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

"easier moving of code blocks
vnoremap > >gv
vnoremap < <gv


"Plugin user pref
"================

" CTags pre
"默认打开Taglist 
let Tlist_Auto_Open=0
let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"autocmd FileType java set tags+=D:\tools\java\tags  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的

map <F2> :Tlist<cr>

"BufExplorer
map <C-x> :BufExplorer<cr>

"TODO more buf actions

"NERDTree,oh~~my
map <F1> :NERDTreeToggle<cr>

"TODO modify nerdcommenter and make it more suitable.
autocmd VimEnter * map <leader>/ <leader>c<space>

"TODO dev a plugin for content shared btw vim instances...

"TODO add more api here
"tmp overite the mapping for Yanking.
"autocmd VimEnter * map <C-P> :FufFile<CR>
"hack,dont where such setting has been overide!
autocmd VimEnter * set ignorecase smartcase
"autocmd VimEnter * set noautochdir
"autocmd BufEnter * set noautochdir

"TODO shortcuts for the filefinder
"nmap <leader>f :FF<CR>

"TODO for the fucking awesome command-T 
let g:CommandTMaxCachedDirectories=0
let g:CommandTMatchWindowAtTop=0

"TODO correct the filetype
au FileType javascript setl foldmethod=indent

"TODO shortcut for lucyfilefinder

"TODO tmp hack the filetype foldmethod


" combine omni plugin with autocomplete
"let g:AutoComplPop_Behavior = { 
         "\'c': [ {'command' : "\<C-x>\<C-o>",
         "\'pattern' : ".",
         "\'repeat' : 0}
         "\]}

" combine acp and snipmate
"let g:acp_behaviorSnipmateLength=1

" TODO for the tagbar   
map <F3> :TagbarToggle<cr>


"add the alpha support
"au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 234)
"几个更改alpha的快捷键
"map <M-8> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 180) <CR>
"map <M-9> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 230) <CR>
"map <M-0> <ESC>:call libcallnr("vimtweak.dll", "SetAlpha", 255) <CR>


"temp hack the clipboard
"TODO upgrade the vim version
nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP


" resize current buffer by +/- 5 
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-down> :resize +5<cr>
nnoremap <C-up> :resize -5<cr>
nnoremap <C-right> :vertical resize +5<cr>


"swap the window
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>


"TODO find out the conflict
if has("gui_running")
    colorscheme peaksea
else
    colorscheme desert
    set t_Co=256
    "colorscheme koehler
endif

"make the background transparent
hi Normal ctermbg=NONE ctermfg=252 



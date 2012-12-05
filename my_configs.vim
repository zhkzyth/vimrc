"vimrc file for python/js/much more....
"author :zhkzyth@gmail.com

"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
"autocmd! bufwritepost my_configs.vim source %


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"winpos 5 5          " 设定窗口位置  
"set lines=40 columns=155    " 设定窗口大小  
set nu              " 显示行号  
set go=             " 不要图形按钮  
"color asmanian2     " 设置背景主题  
set guifont=Courier_New:h10:cANSI   " 设置字体  
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
"set foldnestmax=10      "deepest fold is 10 levels
"set foldlevel=1
set foldenable      "[nofoldenable,..]
set foldmethod=indent   "[indent,manual,....]
""save the fold state.
au BufWinLeave * mkview
au BufWinEnter * silent loadview

"set background=dark "背景使用黑色 
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

" 显示中文帮助
if version >= 603
   set helplang=cn
   set encoding=utf-8
endif

" 设置配色方案
"colorscheme murphy
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

"代码补全 
set completeopt=preview,menu 

"共享剪贴板  
set clipboard=unnamedplus
"从不备份  
set nobackup
""禁止生成临时文件
set noswapfile

""自动保存
set autowrite
"set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏


" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm


""======================= tab pref ===========================
" Tab键的宽度
set tabstop=3
" 统一缩进为4
"set softtabstop=3
"set shiftwidth=3
" 不要用空格代替制表符
"set noexpandtab
" 在行和段开始处使用制表符
"set smarttab
" 历史记录数
"set history=1000
" 使回格键（backspace）正常处理indent, eol, start等
"set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

""==================== search pref ==========================
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
"set gdefault

" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0

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
"set cindent


"======================================== 自动补全 括号匹配 =====================================
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O  
"according to the file type to add <CR>
"inoremap { {}<ESC>i
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <leader>f :find<cr>
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
" map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
"nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
"nnoremap <C-F2> :vert diffsplit 
"新建标签  
"map <M-F2> :tabnew<CR>  
"列出当前目录文件  
"map <F3> :tabnew .<CR>  

"better copy & paste ??
"set pastetoggle=<F2>
"set clipboard=unamed

"Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

"easier moving of code blocks
vnoremap > >gv
vnoremap < <gv

map <leader>/ :call ToggleComment()<CR>
"TODO 查阅其他人写的comment插件，改成单个键就能完成comment\
"     尝试block comment的用法
" Comments range (handles multiple file types)
function! ToggleComment() range
   if &filetype == "c" || &filetype == "php" || &filetype == "css" || &filetype == 'html' || &filetype == 'xml' || &filetype == 'xslt'
            \ || &filetype == 'xsd'
      if getline('.') !~ '^[/(]\*\|<!--\(.*\)$'
         if getline('.') =~ '^\*'
            let tgComStr ='s/^\(.*\)$/\/\* \1 \*\//'
         else
            let tgComStr ='s/^\(.*\)$/<!-- \1 -->/'
         endif
      else
         let tgComStr ='s/^\([/(]\*\|<!--\) \(.*\) \(\*[/)]\|-->\)$/\2/'
      endif
      execute ":" . a:firstline . "," . a:lastline . tgComStr
   else
      "not comment yet
      if getline('.') !~ '^\(#\|\"\|\/\/\)'
         if &filetype == "java" || &filetype == "cpp" || &filetype == "cs" || &filetype == "javascript" || &filetype == "js"
            let commentString = "//"
         elseif &filetype == "vim"
            let commentString = '"'
         else
            let commentString = "#" 
         endif
         execute ":" . a:firstline . "," . a:lastline . 's,^,' . commentString . ','
      else
         if &filetype == "java" || &filetype == "cpp" || &filetype == "cs"
            let commentString = "//"
         elseif &filetype == "vim"
            let commentString = '"'
         else
            let commentString = "#"
         endif
         execute ":" . a:firstline . "," . a:lastline . 's,^' . commentString . ',,'
      endif
   endif
endfunction
"---------------------end of comment function try----------------------------------------------------"

"代码补全 
"set completeopt=preview,menu 
"共享剪贴板  
set clipboard=unnamedplus
"从不备份  
set nobackup
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
"set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
"set foldcolumn=0
"set foldmethod=indent 
"set foldlevel=3 
"set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
"set tabstop=3
" 统一缩进为4
"set softtabstop=3
"set shiftwidth=3
" 不要用空格代替制表符
"set noexpandtab
" 在行和段开始处使用制表符
"set smarttab
" 历史记录数
"set history=1000
"禁止生成临时文件
"set nobackup
"set noswapfile
"搜索忽略大小写
"set ignorecase
"搜索逐字符高亮
"set hlsearch
"set incsearch
"行内替换
"set gdefault
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
"set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
"set cmdheight=2
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 使回格键（backspace）正常处理indent, eol, start等
"set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
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
" "set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile *  setfiletype txt

"自动补全
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin user pref
"important! do not modify the plugin_type.vim,so the author can keep updating it ,and we get
"benefit from the upgrad
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CTags pre
"默认打开Taglist 
let Tlist_Auto_Open=1 
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

"BufExplorer
map <C-x> :BufExplorer<cr>
"TODO more buf actions
"

"NERDTree,oh~~my
map <F1> :NERDTreeToggle<cr>

"设置tags  
"set tags=tags  
set autochdir 


""text.vim
" 高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile *  setfiletype txt

"set autochdir 

"TODO dev a plugin for content shared btw vim instances....


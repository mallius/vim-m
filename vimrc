"C语言自动缩进
set cindent
"C语言自动缩进

"花括号自动补全
:inoremap { <c-r>=ClsoeBrace()<CR>
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap ;; <ESC>A;<CR>

function ClsoeBrace()
   if getline('.')[col('.') - 2] == '='
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 3] == '='
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 1] == '{'
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 2] == '{'
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 2] == ','
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 3] == ','
      return "{}\<ESC>i"
   else
      return "{\<ENTER>}\<ESC>O"
   endif
endf
"花括号自动补全

"让vim记忆上次编辑的位置
autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \    exe "normal g'\"" |
            \ endif
"让vim记忆上次编辑的位置


"解决vim中文乱码
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8 
set encoding=prc
"解决vim中文乱码

set nu
syntax on

"set guifont=Courier



" 总是显示状态行
set laststatus=2


" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1


"颜色方案
colorscheme ron


"显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

"禁止生成临时文件
set nobackup

"搜索逐字符高亮
set hlsearch
set incsearch



"为C程序提供自动缩进
"set smartindent



"for ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"for ctags 


"onmicppcompete插件，不用2014-03-27-22:06
"set nocp    
"filetype plugin on

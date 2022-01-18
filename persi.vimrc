set nocompatible "纯VIM
:nnoremap Q <Nop> "屏蔽Q,以免进入Ex模式
syntax enable "语法高亮
set history=50 "历史记录50条
"set foldcolumn=1 "margin left
set noeb " 去掉输入错误的提示声音
set noerrorbells
set novisualbell
set t_vb=
set tm=500

filetype plugin on
filetype plugin indent on

set nobackup "禁止生成备份文件
set noswapfile "禁止生成临时文件
set autowrite "自动保存
set autoread "自动读取
set ruler "打开状态栏标尺
set magic "设置魔术
set guioptions-=T  "隐藏工具栏
set guioptions-=m  "隐藏菜单栏
set clipboard+=unnamed "共享剪贴板,支持Ctrl+C/V复制粘贴
colorscheme evening "配色主题

set cmdheight=1
au FocusGained,BufEnter * checktime
let mapleader = ","
nmap <leader>w :w!<cr>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=en_US
"set mouse=a
set selection=exclusive
set selectmode=mouse,key
"set helplang=cn

set ruler "显示当前位置
set number "显示行号
set background=dark "背景色
set showcmd "显示命令
set laststatus=2 "一直显示状态栏
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %yCWD:\ %r%{getcwd()}%h\ \ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L/%p%\%%\) "状态栏信息

set autoindent "自动缩进
set smartindent "
set wrap
set cindent "C缩进
set tabstop=2 "硬TAB
set softtabstop=2 "软TAB
set shiftwidth=2 "缩进空格数
set expandtab "空格替换TAB
set smarttab "智能TAB

set showmatch "显示匹配括号
set mat=2 "匹配括号闪烁频率
set ignorecase "忽略大小写
set smartcase
set matchtime=5 "1/10秒延迟
set ignorecase "搜索逐字符高亮
set hlsearch "高亮搜索
set incsearch "搜索中匹配

":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.conf,*.ini,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

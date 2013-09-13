
"==============================================================================
"自定义配置
"==============================================================================
syntax on					"语法高亮

set noswapfile				"禁止产生swp文件

set number					"显示行号         

set nocompatible			"不是用vi键盘模式

set cursorline				"突显当前行    

set ruler					"打开状态来标尺

set shiftwidth=2			"设定<<和>>命令移动时的宽度为4   

set softtabstop=4			"按退格键时可以一次删掉4个空格    

set tabstop=4               " 设定 tab 长度为 4

set nobackup                " 覆盖文件时不备份

set autochdir               " 自动切换当前目录为当前文件所在的目录

filetype plugin indent on   " 开启插件

set backupcopy=yes          " 设置备份时的行为为覆盖

set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感

"set nowrapscan             " 禁止在搜索到文件两端时重新搜索

set wrap					" 自动这行

set incsearch               " 输入搜索内容时就显示搜索结果

set hlsearch                " 搜索时高亮显示被找到的文本

set noerrorbells            " 关闭错误信息响铃

set novisualbell            " 关闭使用可视响铃代替呼叫

"set t_vb=                  " 置空错误铃声的终端代码

set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号

" set matchtime=2           " 短暂跳转到匹配括号的时间

set magic                   " 设置魔术

set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

"set guioptions-=T          " 隐藏工具栏

"set guioptions-=m           " 隐藏菜单栏

set smartindent             " 开启新行时使用智能自动缩进

set backspace=indent,eol,start	" 不设定在插入状态无法用退格键和 Delete 键删除回车符

set cmdheight=1             " 设定命令行的行数为 1

set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)

set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\		" 设置在状态行显示的信息

set cc=80                   "设置色彩列

set cursorline              "光标行高亮
"红底篮字无下划线gui属性无设置
autocmd InsertEnter * highlight  CursorLine cterm=NONE ctermbg=Red ctermfg=Green guibg=None guifg=None

set cursorcolumn            "光标列高亮

autocmd InsertEnter * highlight CursorColumn cterm=NONE  ctermbg=Red  ctermfg=Green guibg=None guifg=None

set foldenable              " 开始折叠

set foldmethod=syntax       " 设置语法折叠

set foldcolumn=0            " 设置折叠区域的宽度

setlocal foldlevel=1        " 设置折叠层数为

set list					" 显示tab和空格 

set lcs=tab:\|\ ,nbsp:%,trail:-		" 设置tab和空格样式

highlight LeaderTab guifg=#666666	
" 设定行首tab为灰色
"  匹配行首tab
 match LeaderTab /^\t/
"窗口大小设置
"高度设置
"map <F7> <ESC><C-W>-  
"map <F8> <ESC><C-W>+ 
"宽度设置
map <F7> <ESC><C-W><  
map <F8> <ESC><C-W>>  
" set foldclose=all         " 设置为自动关闭折叠
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"------------------------------------------------------------------------------
" 用空格键来开关折叠
" return OS type, eg: windows, or linux, mac, et.st..

function! MySys()

    if has("win16") || has("win32") || has("win64") || has("win95")

        return "windows"

	  elseif has("unix")

        return "linux"

    endif

endfunction
"------------------------------------------------------------------------------
" 用户目录变量$VIMFILES

if MySys() == "windows"

    let $VIMFILES = $VIM.'/vimfiles'

elseif MySys() == "linux"

    let $VIMFILES = $HOME.'/.vim'

endif
"------------------------------------------------------------------------------
" 设定doc文档目录
let helptags=$VIMFILES.'/doc'
"------------------------------------------------------------------------------
"字符集
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
"设置字体
"Buffers操作快捷方式!
"------------------------------------------------------------------------------
"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>
" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1
"------------------------------------------------------------------------------
" 打开javascript折叠
let b:javascript_fold=1
"打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
"------------------------------------------------------------------------------
" 设置字典 ~/.vim/dict/文件的路径
autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict
"------------------------------------------------------------------------------
" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shi"=====================================
autocmd FileType python map :!python %
"------------------------------------------------------------------------------
"taglist插件
if MySys() == "windows"                " 设定windows系统中ctags程序的位置
    "let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
elseif MySys() == "linux"              " 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif

nnoremap <silent><F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1
"使用前在目录中执行ctags -R *产生tags
set tags=/web/www/tags
"也可以在vim命令中用:set tags+=/web/www/tags
"使用 Ctrl+] 就可以自动跳转至定义,Ctrl+t 可以返回上一次查看位置,ctr+o可以递归返回上个打开的窗口
set autochdir
"------------------------------------------------------------------------------
"模板
"molokai,desertEx,desert,jellybeans,candystripe,ubuntu系统北京设置成黑色，字体为白色
colorscheme molokai
"------------------------------------------------------------------------------
"php"开启phpcomplete插件
filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"先按下 Ctrl+x进入^X模式,再按下 Ctrl+o， 就能看到提示列表框，以及对应的function，还有对应的函数定义比如参数等等Ctrl+n, Ctrl+p 来上下选择，ESC 来取消提示
"------------------------------------------------------------------------------
""NERDtree插件
":ERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
"------------------------------------------------------------------------------
" plugin - NERD_commenter.vim   注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR> 
"------------------------------------------------------------------------------
" plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释
" ,DoxAuthor:将文件名，作者，时间等,DoxLic:  license注释,Dox：函数及类注释
let g:DoxygenToolkit_authorName="doifusd"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>a :DoxAuthor<CR>					
map <leader>f :Dox<CR>
map <leader>b :DoxBlock<CR>
map <leader>c O/*  */<LEFT><LEFT><LEFT>
let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
"let g:DoxygenToolkit_blockHeader="------------------------------" 
"let g:DoxygenToolkit_blockFooter="------------------------------" 
let g:DoxygenToolkit_authorName="doifusd" 
let g:DoxygenToolkit_licenseTag="My own license"
"------------------------------------------------------------------------------
" plugin – ZenCoding.vim 很酷的插件，HTML代码生成
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1
"------------------------------------------------------------------------------
"jsde的美化工具jsbeautify
"默认的话是按\ff
nmap <silent> <leader>js :call g:Jsbeautify()<cr> 
"------------------------------------------------------------------------------
" plugin – checksyntax.vim    JavaScript常见语法错误检查
" 默认快捷方式为 F5
let g:checksyntax_auto = 0	"自动检查
"------------------------------------------------------------------------------
" plugin - NeoComplCache.vim    自动补全插件
"------------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1 
"let g:AutoComplPop_NotEnableAtStartup = 1
"let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'
let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'

" Enable omni completion. 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 

" Enable heavy omni completion. 
if !exists('g:neocomplcache_omni_patterns') 
let g:neocomplcache_omni_patterns = {} 
endif 
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete 
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::' 

"<TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

 "snippets expand key
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)

set history=4000

"------------------------------------------------------------------------------
" plugin - SuperTab    自动补全插件
let g:SuperTabRetainCompletionType=2 
let g:SuperTabDefaultCompletionType = "<c-n>"
"------------------------------------------------------------------------------
" plugin - html5配置
"禁用事件处理程序属性的支持：
"let g:html5_event_handler_attributes_complete = 0
"禁用RDFa属性的支持：
"let g:html5_rdfa_attributes_complete = 0
"禁用微观数据的属性支持：
"let g:html5_microdata_attributes_complete = 0
"禁用WAI-ARIA属性的支持：
"let g:html5_aria_attributes_complete = 0
"------------------------------------------------------------------------------
" plugin - fencview 增强 vim 的编码检测
"------------------------------------------------------------------------------
"-----------------------------------------------------------------
" Syntax file for jQuery 
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
"------------------------------------------------------------------------------
" plugin - jslint js 语法校验
"You also can call it manually via `:JSLintUpdate`
let g:JSLintHighlightErrorLine = 0
"------------------------------------------------------------------------------
" plugin - web-indent JavaScript 的语法缩进
let g:js_indent_log = 0
"------------------------------------------------------------------------------
" plugin - jsbeautify JavaScript 代码格式化，快捷键是 <Leader>ff
"bind the g:Jsbeautify() function to any short key you like 
"------------------------------------------------------------------------------
" plugin - vim-markdown 高亮 markdown 格式
"------------------------------------------------------------------------------
" plugin - vim-lesscss 高亮 lesscss 格式
 autocmd filetype css setlocal equalprg=csstidy
"------------------------------------------------------------------------------
" plugin - vim-css3 高亮 css3 中的属性
"------------------------------------------------------------------------------
"php语法检查
"------------------------------------------------------------------------------
map <C-J> :!php -l %<CR>
"检查当前文件代码语法(php){{{
function! CheckSyntax()
 if &filetype!="php"
  echohl WarningMsg | echo "Fail to check syntax! Please select the right file!" | echohl None
  return
 endif
 if &filetype=="php"
  " Check php syntax
  setlocal makeprg=\"php\"\ -l\ -n\ -d\ html_errors=off
  " Set shellpipe
  setlocal shellpipe=>
  " Use error format for parsing PHP error output
  setlocal errorformat=%m\ in\ %f\ on\ line\ %l
 endif
 execute "silent make %"
 set makeprg=make
 execute "normal :"
 execute "copen"
endfunction
map <F6> :call CheckSyntax()<CR>
"}}}
"------------------------------------------------------------------------------

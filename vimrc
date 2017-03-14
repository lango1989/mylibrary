"***********************************************************
"__________________ vim-scrips-plugin ______________________
"alternate
"ctrlp
"doxygen-toolkit
"nerd-commenter
"YoucompleteMe  '/usr/lib/vim-youcompleteme/'
"fugitive
"UltiSnips
"AutoPair


"***********************************************************
"____________________ Common config ________________________
set nocompatible
filetype plugin indent on

set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4

set number
set autoindent
set cindent
syntax on
syntax enable
set showcmd

set showmatch
set ignorecase
set incsearch
set hlsearch

"set backup
"set backupext=.backup
"set patchmode=.orig

set foldenable	
"set fileencodings=ucs-bom,utf-8,b18030

"inser mode <C-v> input your key
"let mapleader=','
inoremap jj <ESC>
inoremap '' <right>
inoremap ;; <ESC>A;<ESC>

"***********************************************************
"_____________________ statusline __________________________
set laststatus=2
func! GetMode()
    let mode=mode()
    if mode=="i"
        let mode="Insert"
    elseif mode=="v"
        let mode="Visual"
    elseif mode=="V"
        let mode="V@Line"
    elseif mode==""
        let mode="V@Block"
    elseif mode=="R"
        let mode="Replace"
    else
        let mode="Normal"
    endif
    return mode
endfunc

hi User1 term=bold cterm=bold ctermbg=4* ctermfg=3*
hi User2  ctermbg=1* ctermfg=0
hi User3  ctermbg=5* ctermfg=0
hi User4  ctermbg=2* ctermfg=0
hi User9  ctermbg=6  ctermfg=0

set statusline=%1*>>>>\ %{GetMode()}\ %2*\ %F\ %3*%m%r%w\ %9*\ %=\ 
set statusline+=%-10(%l,%c%)\ %3*\ %{&fileformat}\ 
set statusline+=%2*\ %{&fileencoding}\ %1*\ %Y\ 
set statusline+=%4*\ %{fugitive#statusline()}\ 
set statusline+=%9*\ %{strftime(\"%m-%d\ %H:%M\")}\ 

"***********************************************************
"____________________ C/C++/LLDB ___________________________
map <F5> :call RUN()<CR>
func! RUN()
    exec "w"
    if &filetype == 'c'
        exec "!clang % -g -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!clang++ % -g -o %<"
        exec "! ./%<"
    endif
endfunc
        

map <F6> :call LLDB()<CR>
func! LLDB()
    exec "w"
    if &filetype == 'c'
        exec "!clang % -g -o %<"
        exec "!lldb ./%<"
    elseif &filetype == 'cpp'
        exec "!clang++ % -g -o %<"
        exec "!lldb ./%<"
    endif
endfunc


"***********************************************************
"____________________ YoucompleteMe ________________________
let g:ycm_warning_symbol = '*>'

highlight YcmErrorLine ctermfg=0 ctermbg=1*
highlight YcmErrorSign ctermfg=7* ctermbg=1*

highlight YcmWarningLine ctermfg=0 ctermbg=4*
highlight YcmWarningSign ctermfg=7* ctermbg=4*

"highlight Pmenu ctermfg=4 ctermbg=7 
highlight PmenuSel ctermfg=8 ctermbg=3
highlight SpellBad ctermfg=7* ctermbg=4*

let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0		
let g:ycm_seed_identifiers_with_syntax=1 
"*********************************************************** 
"_____________________ alternate ___________________________ 
map <silent>aa :A<CR> 

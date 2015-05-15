" vim:fdm=marker
 
let g:python_host_prog='/usr/bin/python2.7'
 
" Plugins {{{
call plug#begin('~/.nvim/plugged')
 
" UI
Plug 'Bling/vim-airline'
Plug 'tomasr/molokai'
Plug 'kshenoy/vim-signature'
" Plug 'Yggdroot/indentLine'
 
" Behaviour
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-repeat'
 
" Utilities
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
 
" Code utilities - completion, syntax
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'TaskList.vim'
 
" Edit motion
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'
Plug 'Lokaltog/vim-easymotion'
 
 
" Generic for writing text
Plug 'vim-scripts/LanguageTool'
Plug 'reedes/vim-pencil'
 
" Markdown utils
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'suan/vim-instant-markdown'
Plug 'dhruvasagar/vim-table-mode'
 
 
" Code edit utilities
Plug 'vim-scripts/tComment'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
 
" Javascript
Plug 'maksimr/vim-jsbeautify'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'einars/js-beautify'
Plug 'othree/yajs.vim'
Plug 'vim-scripts/JavaScript-Indent'
Plug 'marijnh/tern_for_vim'
Plug 'KabbAmine/gulp-vim'
 
" HTML
Plug 'vim-scripts/HTML-AutoCloseTag'
 
call plug#end()
" }}}
 
set nocompatible
let mapleader=','
 
" General {{{
syntax on
filetype plugin on
colorscheme molokai
 
set bs=2
 
set nobackup
set nowb
set noswapfile
" Search {{{
set incsearch
set hlsearch
set ignorecase
" }}}
set autoread
set ruler
" }}}
" UI {{{
set number
set laststatus=2
set foldenable
" Show all proposition when complete commands
set wildmenu
set wildmode=list:longest,full
 
" Show special chars
set listchars=nbsp:¤,tab:▸\ ,eol:¬
set list
" Highlight current line
set cursorline
" }}}
 
" Bépo {{{
noremap é w
noremap É W
" }}}
 
autocmd FileType javascript set makeprg=npm
 
autocmd BufRead .nvimrc set foldmethod=marker
 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 
" Formatting {{{
set tabstop=4     " An indentation every four columns
set shiftwidth=4  " Use indents of 4 spaces
set expandtab     " Tabs are spaces, not tabs
set softtabstop=4 " Let backspace delete indent
set nojoinspaces  " Prevents inserting two spaces after punctuation on a join (J)
" }}}
" Plugins configuration {{{
" Airline {{{
let g:airline_powerline_fonts=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}}
" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_javascript_checkers      = ['eslint']
" }}}
" CtrlP {{{
let g:ctrlp_custom_ignore = 'node_modules\|.git'
" }}}
 
let g:used_javascript_libs = 'underscore,chai'
 
let delimitMate_expand_cr = 1
 
vmap <Enter> <Plug>(EasyAlign)
 
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
 
" IndentLine {{{
let g:indentLine_char = '¦'
" }}}
 
let g:languagetool_jar='/home/thomas/.software/LanguageTool-2.9/languagetool-commandline.jar'
let g:pandoc#spell#default_langs = ['fr', 'en']
 
let g:table_mode_corner='|'
let g:tlWindowPosition=1
highlight Comment cterm=italic

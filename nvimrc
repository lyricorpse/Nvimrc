"=======================================
" Vim Config
"---------------------------------------
" Author: Feng Zhu
" Update: 2015-09-30
" Version: 1.3.0
"=======================================

"---------------------------------------
" Vundle
"---------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'reedes/vim-colors-pencil'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'msanders/snipmate.vim'
Plugin 'plasticboy/vim-markdown'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"---------------------------------------
" Basic settings
"---------------------------------------
" Disable backup and swp
set nobackup
set noswapfile
set nowritebackup

" Leader key
let mapleader=","

" Highlignting
syntax on

" Ctags
set tags+=^tags

" Remember last position
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

set autochdir

" Show whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
set t_Co=256

" Show command
set showcmd
set scrolloff=6

" Lines
set number
set tw=79
set nowrap
set fo-=t " don't automatically wrap text when typing
set colorcolumn=90

" Formatting of paragraphs
vmap Q gq
nmap Q gqap

" Undo
set history=700
set undolevels=700

" Indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

vnoremap < <gv
vnoremap > >gv

" Chinese encoding
set ambiwidth=double
set fencs=utf-8,gb18030,utf-16,big5

" Searching
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

noremap <Leader>n :nohl<CR>
vnoremap <Leader>n :nohl<CR>
inoremap <Leader>n :nohl<CR>

" Tabs
noremap ct :tabnew<CR>

" Windows
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

" Pairing
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>

function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
else
	return a:char
endif
endfunction

" Inserting system time
nmap <silent><leader>t i <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

" Sort
vnoremap <Leader>s :sort<CR>

" LaTeX
let s:extfname = expand("%:e")
if s:extfname ==? "tex"
    set spell spelllang=en_us
    set wrap
endif

"---------------------------------------
" Plugin - Pencil
"---------------------------------------
color pencil
set background=dark
let g:pencil_terminal_italics = 1
" let g:airline_theme = 'pencil'
let g:pencil_spell_undercurl = 1
let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal


"---------------------------------------
" Plugin - NerdCommenter
"---------------------------------------
map <c-h> <leader>c<space>
map <c-l> <leader>cl<space>
let NERDSpaceDelims=1


"---------------------------------------
" Plugin - NerdTree
"---------------------------------------
map <C-n> :NERDTreeToggle<CR>


"---------------------------------------
" Plugin - Markdown
"---------------------------------------
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_no_default_key_mappings=1


"---------------------------------------
" Plugin - NCL
"---------------------------------------
au BufRead,BufNewFile *.ncl set filetype=ncl
au! Syntax newlang source $VIM/ncl.vim

set complete-=k complete+=k
set wildmode=list:full
set wildmenu
au BufRead,BufNewFile *ncl set dictionary=~/.nvim/dictionary/ncl.dic

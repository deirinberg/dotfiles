"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be sure to read the README!
"   shortcuts:
"   a: ack from the current directory
"   b: browse tags
"   c: toggle comments
"   ;C: toggle block comments
"   nt: open file in new tab
"   l: toggle NERDTree
"   h: open a shell in a new tab
"   k: syntax-check the current file
"   m: toggle mouse support
"   p: toggle paste mode
"   o: open file
"   s: split window
"   hs: horizontal split
"   t: new tab
"   w: close tab
"   ed: edit vimrc
"   src: source vimrc
"   tgt: display target of cursor position
"   kj: enter normal mode and save
"   Ctrl+{h,j,k,l}: move among windows
"   ii: operate on all text at current indent level
"   ai: operate on all text plus one line up at current indent level
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vundle
set encoding=utf-8
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle
Bundle 'gmarik/Vundle.vim'

" color schemes
Bundle 'brendonrapp/smyck-vim'

" plugins
Bundle 'Valloric/YouCompleteMe'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tomtom/checksyntax_vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/trailing-whitespace'
Bundle 'vim-scripts/taglist.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'raimondi/delimitMate'
Bundle 'gregsexton/gitv'
Bundle 'godlygeek/tabular'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'toyamarinyon/vim-swift'

" syntax files
Bundle 'jelera/vim-javascript-syntax'
Bundle 'tpope/vim-markdown'
Bundle 'voithos/vim-python-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
call vundle#end()

" syntax highlighting and auto-indentation
syntax on
filetype indent on
filetype plugin on
inoremap # X<C-H>#
set ai
set si
set nu
set nofoldenable
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,81),",")

" omg automatic comment insertion is the worst
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" expand tabs to 2 spaces
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab

" auto save buffers whenever you lose focus
au FocusLost * silent! wa

" auto save buffers when you switch context
set autowriteall

" buffer navigation
nnoremap <silent> <tab> <C-i>
nnoremap <silent> <S-tab> <C-o>

" leave showtabline as default (for now)
set showtabline=1

" searching options
set incsearch
set ignorecase
set smartcase
set hlsearch

" escape search highliting by hitting return
nnoremap <CR> :noh<CR><CR>

" disable backups
set nobackup
set nowritebackup
set noswapfile

" disable annoying beep on errors
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" font options
set background=dark
set t_Co=256
colorscheme smyck

" keep at least 5 lines below the cursor
set scrolloff=5

" window options
set showmode
set showcmd
set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2

" enable mouse support
set mouse=a

" word wrapping
set wrap
set linebreak
set nolist

" better tab completion on commands
set wildmenu
set wildmode=list:longest

" close buffer when tab is closed
set nohidden

" better moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" shortcuts to common commands
let mapleader = ";"
nnoremap <leader>b :TlistToggle<CR>
nnoremap <leader>c :TComment<CR>
nnoremap <leader>C :TCommentBlock<CR>
vnoremap <leader>c :TComment<CR>
vnoremap <leader>C :TCommentBlock<CR>
nnoremap <leader>nt :tabnew<CR>:CtrlP<CR>
nnoremap <leader>l :NERDTreeTabsToggle<CR>
nnoremap <leader>k :CheckSyntax<CR>
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>p :set invpaste<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>hs :split<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>ed :tabnew ~/.vimrc<cr>
nnoremap <leader>src :source ~/.vimrc<cr>
nnoremap <leader>tgt :set cursorcolumn! cursorline!<CR>

" show hidden files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = []
let NERDTreeIgnore += ['^\.DS_Store$']

" kj/jk is better than ctrl-c or esc - also autosave when leaving insert mode
inoremap kj <Esc>:w<CR>
inoremap jk <Esc>:w<CR>

"swap areas of text
vnoremap <C-X> <Esc>`.``gvP``P

" remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" more logical vertical navigation
nnoremap <silent> k gk
nnoremap <silent> j gj

" ctrl p settings
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|dist\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

call vundle#config#require(g:bundles)

" Plug
call plug#begin('~/.vim/plugged')
Plug 'sclo/haproxy.vim'
Plug 'wincent/terminus'
Plug 'ervandew/supertab'
Plug 'tmux-plugins/vim-tmux'
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'pearofducks/ansible-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
Plug 'wincent/ferret', { 'on': ['Ack', 'Acks'] }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
Plug 'terryma/vim-expand-region'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'python-mode/python-mode', { 'for': 'python' }
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
call plug#end()

let NERDTreeIgnore=['\.pyc$', '\.orig$']
map <C-x> :NERDTreeToggle<CR>

let g:airline_powerline_fonts=1
let g:airline_theme='violet'

let g:TerminusFocusReporting=0

let g:ansible_unindent_after_newline = 1

let g:tagbar_compact = 1
let g:tagbar_sort = 0
nmap <leader>t :TagbarToggle<CR>

" filetype plugin indent on
syntax on
set background=dark
set laststatus=2
set encoding=UTF-8
set hlsearch
set list
set listchars=tab:▸\ ,eol:¬
set number
set showmatch
set wildignore+=*.pyc,node_modules,*.egg-info
set wildmode=list:longest
set nofoldenable
set cursorline
" highlight clear SignColumn
" set colorcolumn=80

"""""""""""""""""""""""""""""""""""""""""""""""""
" Text and Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""
" Use smart tabs
" set smarttab

" 1 tab == 4 spaces
" set shiftwidth=4
" set softtabstop=4

" set ai " Auto indent
" set si " Smart indent

" modern backspace behavior
set backspace=indent,eol,start

" YouCompleteMe plugin
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'


" Plug
call plug#begin('~/.vim/plugged')
Plug 'sclo/haproxy.vim'
" Plug 'wincent/terminus'
Plug 'ervandew/supertab'
Plug 'tmux-plugins/vim-tmux'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'davidhalter/jedi-vim'
Plug 'pearofducks/ansible-vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
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
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'ryanoasis/vim-devicons'
Plug 'kaicataldo/material.vim'
Plug 'RRethy/vim-illuminate'
Plug 'pseewald/vim-anyfold'
call plug#end()

let NERDTreeIgnore=['\.pyc$', '\.orig$']
map <C-x> :NERDTreeToggle<CR>

let g:pymode_python = 'python3'

let g:airline_powerline_fonts = 1
let g:airline_theme = 'violet'
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = "\ue0b4"
let g:airline_right_sep = "\ue0b6"
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

let g:pymode_warnings = 0
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:pymode_rope = 0

" let g:TerminusFocusReporting=0

let g:ansible_unindent_after_newline = 1

let g:tagbar_compact = 1
let g:tagbar_sort = 0
nmap <leader>t :TagbarToggle<CR>

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0

"""" Ale plugin settings
let g:ale_linters = {'python': ['pylint', 'flake8', 'autopep8'], 'c': ['gcc'], 'c++': ['gcc'], 'ansible': ['ansible-lint'], 'yaml': ['yamllint'], 'sql': ['sqlint']}

highlight ALEErrorSign ctermbg=18 ctermfg=1
highlight ALEError ctermfg=1 cterm=underline
highlight ALEWarning ctermfg=3 cterm=underline
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_offset = 1000000
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" vim-airline integrates with ALE for displaying error information in the status bar.
let g:airline#extensions#ale#enabled = 1
"""" End Ale plugin settings

"""" Nerdcommenter plugin settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
"""" End Nerdcommenter plugin settings

syntax on
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
" Automatically reload files if changed from outside.
set autoread
set showcmd
set updatetime=100
" Spell check!
set spelllang=en_gb
" Display messages for changes (ie. yank, delete, etc.)
set report=0
highlight clear SignColumn
" set colorcolumn=80

"""" Material theme settings
" Enable true colors
if (has("termguicolors"))
  set termguicolors
endif

" material_theme_style = 'default' | 'palenight' | 'dark'
let g:material_theme_style = 'dark'

" To turn on italics, configure as follows:
" let g:material_terminal_italics = 1

set background=dark
colorscheme material
"""" End Material theme settings.

au BufRead,BufNewFile */inventory set filetype=dosini

"""""""""""""""""""""""""""""""""""""""""""""""""
" Text and Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
autocmd Filetype * AnyFoldActivate
set foldlevel=0
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
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'

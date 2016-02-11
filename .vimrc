" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" backup rules
set backup " enable backup files (.txt~)
set undofile " enable persistent undo

silent execute '!mkdir -p $HOME/.vim/tmp/backup'
set backupdir=$HOME/.vim/tmp/backup " where to store backup
silent execute '!mkdir -p $HOME/.vim/tmp/swap'
set directory=$HOME/.vim/tmp/swap " where to store swap
silent execute '!mkdir -p $HOME/.vim/tmp/views'
set viewdir=$HOME/.vim/tmp/views " where to store view
silent execute '!mkdir -p $HOME/.vim/tmp/undo'
set undodir=$HOME/.vim/tmp/undo " where to store undo




" tabstop settings
set tabstop=4 " a tab found in a file will be represented with 4 columns
set softtabstop=4 " when in insert mode <tab> is pressed move 4 columns
set shiftwidth=4 " indentation is 4 columns
set noexpandtab " tabs are tabs, do not replace with spaces

" line numbers
set number

let mapleader=','


set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'https://github.com/ewilazarus/preto'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'spf13/PIV'
NeoBundle 'arnaud-lb/vim-php-namespace'
NeoBundle 'StanAngeloff/php.vim'
"NeoBundle 'scrooloose/syntastic'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'joonty/vdebug'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vim-ruby/vim-ruby'
"NeoBundle 'tpope/vim-rails'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'othree/html5.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tobyS/pdv'
"NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'vim-php/phpctags'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'moll/vim-node'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Slava/tern-meteor'
NeoBundle 'joonty/vim-phpunitqf'
NeoBundle 'hallettj/jslint.vim'
NeoBundle 'walm/jshint.vim'
"NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'vim-scripts/vim-auto-save'

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Vimproc
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
	        let g:make = 'make'
endif
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}
"End Vimproc

"ctrlP: Full path fuzzy file, buffer, mru, tag, … finder for Vim”
NeoBundle 'https://github.com/ctrlpvim/ctrlp.vim.git'

"NerdTree
NeoBundle "https://github.com/scrooloose/nerdtree.git"

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"General
"set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
"set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title

"For CtrlP

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'



set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php']
let g:jsx_ext_required = 0
let g:vimfiler_ignore_pattern =  ''

syntax enable
set background=dark
colorscheme preto

" syntax
syntax on " enable syntax highlighting
" filetype
filetype on " enable filetype detection
filetype plugin on " enable filetype plugins
filetype indent on " enable filetype indentation

"let g:auto_save = 1  " enable AutoSave on Vim startup
"set updatetime=2000

augroup backup
    autocmd!
    autocmd BufWritePre,FileWritePre * let &l:backupext = '~' . strftime('%c') . '.txt'
augroup END



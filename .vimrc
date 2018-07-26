cd ~
" colorscheme koehler
set showcmd         " display incomplete commands
set ruler           " show the cursor position all the time
set wildmenu
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set showbreak=>
se nu
syntax on
set bs=2
" set tw=79         " automatic carriage return at column 
"set lines=40
"set columns=100
set nobackup
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" set textwidth=90
set incsearch       " search as characters are entered
set hlsearch
set ignorecase
set smartcase
set showmatch
"let mapleader=","  " leader is comma (default \)
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 
" command to install pathogen: mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()
set laststatus=2
filetype plugin on
filetype indent on
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" loading external configurations
:so ~/.vim-abbr.vim

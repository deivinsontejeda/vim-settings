set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" My Bundles here:
Plugin 'vim-ruby/vim-ruby'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlp.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Syntastic'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'vim-stylus'
Plugin 'vim-coffee-script'
Plugin 'Markdown-syntax'
Plugin 'neocomplcache'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'thoughtbot/vim-rspec'
" Bundle 'mileszs/ack.vim'

" Color themes
Plugin 'Solarized'
Plugin 'Lucius'
Plugin 'jellybeans.vim'
Plugin 'summerfruit.vim'
Plugin 'summerfruit256.vim'
Plugin 'pyte'
Plugin 'ironman.vim'
Plugin 'oceanlight'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

call vundle#end()
filetype plugin indent on

" Personal default config
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set ffs=unix,dos,mac
set autoindent
set copyindent
set smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set number
set numberwidth=5
set showmatch
set wrap
set colorcolumn=120
set title
set visualbell
set nobackup
set nowritebackup
set noswapfile
set wildmenu
set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set list
set clipboard=unnamed
set autoread
set confirm
set hidden
set t_Co=256
set scrolloff=5
set listchars=tab:>-,trail:·,extends:>,precedes:<
set backspace=indent,eol,start
set hls!
set statusline+=%F
set laststatus=2
set background=dark
syntax on
colorscheme solarized

" Set for tabs
:nmap <C-l> :tabnext<CR>
:nmap <C-h> :tabprevious<CR>
:nmap <C-t> :tabnew<CR>

" Set for CTRL-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Vim-ruby
imap <S-CR> <CR><CR>end<Esc>-cc

" Vim Nerdtree
map ` :NERDTreeToggle<CR>

" Git
map gs :!git status<CR>

" Set list style
let g:netrw_liststyle = 3

"Neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3

" Go setting
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

"
" autocmd BufWritePre * :%s/\s\+$//e

" Rspec
let g:rspec_command = "!bundle exec rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

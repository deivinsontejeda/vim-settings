set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" My Bundles here:
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
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
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'evanleck/vim-svelte'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'prettier/vim-prettier'
Plugin 'dart-lang/dart-vim-plugin'
" Plugin 'neomake/neomake'

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
" set nowrap
set colorcolumn=130
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
" set listchars=tab:>-,trail:~,extends:>,precedes:<,eol:$
set backspace=indent,eol,start
set hls!
set statusline+=%F
set laststatus=2
set background=dark
syntax on
colorscheme solarized

" Search
" set relativenumber
" set cursorline

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" Set for tabs
:nmap <C-l> :tabnext<CR>
:nmap <C-h> :tabprevious<CR>
:nmap <C-t> :tabnew<CR>

"if has('nvim')
"  map <BS> :<C-u>tabprevious<CR>
"endif


" Set for CTRL-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*
set wildignore+=**/node_modules/**,**/bower_components/**,**/tmp/**,**/dist/**
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|node_modules|build|public|bower_components|dist)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Vim-ruby
imap <S-CR> <CR><CR>end<Esc>-cc
imap <C-Return> <CR><CR><C-o>k<Tab>

" Vim Nerdtree
map ` :NERDTreeToggle<CR>

" Git
map gs :!git status<CR>

" Set list style
let g:netrw_liststyle = 5

" Paste
:nmap \o :set paste!<CR>
:nmap \ln :setlocal number!<CR>

"Neocomplcache
" let g:neocomplcache_enable_at_startup = 6
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_min_syntax_length = 3

" Go setting
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 0
let g:go_highlight_build_constraints = 1
let g:go_def_mapping_enabled=0
let g:go_fmt_autosave = 1
let g:go_auto_sameids=1
let g:go_list_type="quickfix"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>s <Plug>(go-implements)

let g:syntastic_go_checkers = ['go', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Strip white space
autocmd BufWritePre * :%s/\s\+$//e

" Rspec
let g:rspec_command = "!bundle exec rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Remove trailling whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

let g:ag_working_path_mode="r"
nnoremap <leader>A viw"hy:Ag '<C-r>h'

" Autoreload .vimrc
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=bold guifg=#00ff00 guibg=#00005f
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=bold guifg=#00ff00 guibg=#00005f
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=bold guifg=#00ff00 guibg=#00005f
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=bold guifg=#00ff00 guibg=#00005f
highlight Search     cterm=bold ctermfg=15 ctermbg=24 gui=bold guifg=#ffffff guibg=#005f87

set timeoutlen=1000 ttimeoutlen=0
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

let g:svelte_preprocessor_tags = [
  \ { 'name': 'ts', 'tag': 'script', 'as': 'typescript' }
  \ ]
let g:svelte_preprocessors = ['ts']

" Prettier Settings
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync

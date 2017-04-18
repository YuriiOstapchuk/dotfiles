call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/nerdcommenter'
Plug 'yegappan/grep'

Plug 'sheerun/vim-polyglot'

Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'

Plug 'gorodinskiy/vim-coloresque'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'mattn/emmet-vim'

Plug 'yegappan/greplace'

Plug 'tpope/vim-surround'

Plug 'powerman/vim-plugin-AnsiEsc'

Plug 'thinca/vim-ref'

Plug 'vim-scripts/nginx.vim'

Plug 'hdima/python-syntax'

Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'ruanyl/vim-fixmyjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

Plug 'Quramy/tsuquyomi'
Plug 'ianks/vim-tsx'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

Plug 'tpope/vim-haml'

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
call plug#end()

call deoplete#enable()

if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  auto VimEnter * PlugInstall
endif

set guicursor=

let python_highlight_all=1
let g:user_emmet_leader_key='<C-Z>'
let g:ctrlp_custom_ignore='node_modules\|git\|deps\|_build'

let g:neomake_open_list=0
let g:neomake_javascript_enabled_makers=['eslint']

autocmd! BufWritePost * Neomake

let g:fixmyjs_use_local=1
let g:fixmyjs_rc_filename=".eslintrc"

let g:NERDSpaceDelims=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDCommentEmptyLines=1
let g:NERDDefaultAlign='left'

" Typescript autocomplete
let g:tsuquyomi_completion_detail=1

" Rust
set hidden
let g:racer_cmd="/home/oym/.cargo/bin/racer"
let g:racer_experimental_completer=1
let g:rustfmt_autosave=1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

let mapleader=","

nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>

syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
set t_Co=256
set t_ut=

colorscheme onedark
let g:onedark_termcolors=256
" colorscheme jellybeans

set wildmenu

set hlsearch

"airline
set laststatus=2
set noshowmode
let g:airline_theme='onedark'

" Enable line numbers
" with width 2
" and grey color

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>nt :call NumberToggle()<cr>

set number
set relativenumber
set numberwidth=2
highlight LineNr ctermfg=grey

" Toggle paste mode with F2
set pastetoggle=<F2>

" turn filetype detection, indent scripts and filetype plugins on
filetype plugin indent on

" Tab spaces ammount
set tabstop=2
set softtabstop=2
" Tab and backspace add and remove shiftwidth
set shiftwidth=2
set smarttab
" Replace tabs with spaces
set expandtab

set cursorline
set cursorcolumn

"line limit
set colorcolumn=101
hi ColorColumn ctermbg=234

" Shift-o delay fix
"set noesckeys

set backupcopy=yes

" Disable mouse
set mouse=

" Enable completion for dash-case vars (css)
set iskeyword+=-
" Disable completion typing until selected
set completeopt=longest,menuone,preview

autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
" Enable nginx highligth
autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" autocmd BufWritePre *.js :Fixmyjs
" autocmd BufWritePre *.jsx :Fixmyjs

autocmd CompleteDone * pclose!

" autocmd vimenter * NERDTree
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

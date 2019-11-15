if has('nvim') || has('termguicolors')
  set termguicolors
endif

set encoding=utf8
set guifont=Sauce\ Code\ Pro\ Nerd\ Font:h15

set hlsearch
set smartindent

set showmatch
set shiftwidth=4
set tabstop=4
set expandtab
set number
set spell spelllang=en_us
set foldmethod=manual
set guicursor=


inoremap jk <Esc>
tnoremap <Esc> <C-\><C-n>

map <C-C> :noh<ENTER>

if has('mouse')
	set mouse=a
endif

function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set relativenumber
  endif
endfunc

map <C-n> :call NumberToggle()<cr> 

" Rbenv Ruby support 
let g:ruby_host_prog = '/Users/jackw/.rbenv/versions/2.4.1/bin/ruby'

" Python 3 Support
let g:python3_host_prog = '/Users/jackw/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/Users/jackw/.pyenv/versions/neovim2/bin/python'

" Strips trailing whitespace on save for php, python, C, & JS.
au BufWritePre *.js :%s/\s\+$//e
au BufWritePre *.php :%s/\s\+$//e
au BufWritePre *.py :%s/\s\+$//e
au BufWritePre *.c :%s/\s\+$//e
au BufWritePre *.h :%s/\s\+$//e
au BufWritePre *.rst :%s/\s\+$//e
au BufWritePre *.rb :%s/\s\+$//e

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
" Utilities
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'

Plug 'ctrlpvim/ctrlp.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'

" Themes
Plug 'ryanoasis/vim-devicons'
Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Python
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'Vimjas/vim-python-pep8-indent'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

filetype plugin indent on


let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#ternjs#filetypes = [
	\ 'jsx',
	\ 'javascript.jsx',
	\ 'vue',
	\ 'javascript'
	\ ]
let g:deoplete#sources#ternjs#timeout = 3
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1


syntax enable 
" set background=dark
" colorscheme NeoSolarized 
colorscheme iceberg 


let g:airline_powerline_fonts = 1
set noshowmode
set termencoding=utf-8

let g:airline#extensions#branch#enabled=1
let g:airline_extension = ['branch', 'hunks', 'tagbar']
let g:airline#extensions#hunks#enabled=1
" let g:airline_theme='solarized'
let g:airline_theme='iceberg'
let g:airline_solarized_bg='dark'

" Turn on nerdtree right away
autocmd vimenter * NERDTree

" Neomake config
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2
hi NeomakeErrorSign cterm=bold ctermfg=1 ctermbg=0 gui=bold guifg=#dc322f guibg=#073642
hi NeomakeWarningSign cterm=bold ctermfg=1 ctermbg=0 gui=bold guifg=#b58900 guibg=#073642 guisp=#b58900
hi NeomakeInfoSign cterm=bold ctermfg=1 ctermbg=0 gui=bold guifg=#268bd2 guibg=#073642 guisp=#268bd2

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_go_enabled_makers = ['golint', 'golangci_lint']
let g:neomake_go_golangci_lint_args = [
    \ 'run', 
    \ '--fast', 
    \ '--enable=gosec', 
    \ '--enable=maligned', 
    \ '--enable=misspell', 
    \ '--enable=lll', 
    \ '--enable=unconvert', 
    \ '--print-issued-lines=false'
    \ ] 
let g:neomake_go_golangci_lint_errorformat = "%f:%l:%c: %m," . 
                                           \ "%f:%l: %m"

" Git config
"hi GitGutterAdd guibg=#073642
"hi GitGutterChange guibg=#073642
"hi GitGutterDelete guibg=#073642
"hi GitGutterChangeDelete guibg=#073642

let g:jedi#force_py_version = 3
let g:pymode_python = 'python3'

set statusline+=%#warningmsg#
set statusline+=%{neomake#statusline#LoclistStatus()}
set statusline+=%*


" Go Config

let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1

au FileType go nmap <leader>g <Plug>(go-def)


if getcwd() =~ $GOPATH
    let g:ctrlp_custom_ignore = 'vendor/'
endif

" JS Config
"
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:prettier#exec_cmd_path = '/Users/jackw/.nvm/versions/node/v9.3.0/bin/prettier-standard'

au FileType javascript nmap <leader>g :TernDef<CR>

" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync


filetype on

" vimspector
let g:vimspector_base_dir = '/Users/okazaki/.local/share/nvim/plugged/vimspector'
" vimspector

let g:indent_guides_enable_on_vim_startup = 1
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open'
let g:airline#extensions#tabline#enabled = 1

set number

set relativenumber

set list

set tabstop=2

set shiftwidth=2

set expandtab

set tags=tags;/,codex.tags;/

set termguicolors

set background=dark

set encoding=UTF-8

set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

set clipboard+=unnamedplus

set mouse=a

set nofoldenable

let mapleader = ","

" remove trailing spaces on saving file
autocmd BufWritePre * :%s/\s\+$//e

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"nnoremap <C-y> :call LanguageClient_contextMenu()<CR>
"let g:LanguageClient_serverCommands = {
"      \ 'nim': ['~/.nimble/bin/nimlsp'],
"      \ }

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

nnoremap <C-h> :vsp<CR>
nnoremap <C-k> :split<CR>
nnoremap <C-c> :close<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-t>o :tabe %<CR>
nnoremap <C-t>b :tabn<CR>
nmap <C-b> <Plug>AirlineSelectPrevTab
nmap <C-p> <Plug>AirlineSelectNextTab

nmap <leader>b :Buffers<CR>
nmap <leader>/ :BLines<CR>
nnoremap <silent> <ESC> <C-\><C-n>
nmap <leader>m <Plug>(coc-rename)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

inoremap <silent> jj <ESC>

" vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
" vimspector

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:ref_refe_encoding = 'euc-jp'

"let $NVIM_COC_LOG_LEVEL = 'info'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:terraform_completion_keys = 1
"let g:terraform_registry_module_completion = 0
let g:terraform_fmt_on_save = 1

autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

autocmd FileType ruby map <C-c> :w<CR>:!ruby -c %<CR>

"au User asyncomplete_setup call asyncomplete#register_source({
"    \ 'name': 'nim',
"    \ 'whitelist': ['nim'],
"    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}

let g:ale_linters = {
\   'nim': ['nimlsp', 'nimcheck'],
\   'python': ['flake8', 'mypy', 'black'],
\   'rust': ['clippy'],
\   'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'nim': ['nimpretty'],
\   'rust': ['rustfmt'],
\   'python': ['isort', 'black'],
\   'ruby': ['rubocop'],
\}
let g:ale_ruby_rubocop_options = '-a'
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖✖'
let g:ale_sign_warning = '⚠⚠'
highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow

call plug#begin('~/.local/share/nvim/plugged')

"Plug 'prabirshrestha/asyncomplete.vim'

Plug 'Shougo/denite.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Shougo/echodoc.vim'

Plug 'scrooloose/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'scrooloose/nerdcommenter'

Plug 'ryanoasis/vim-devicons'

Plug 'skbolton/embark'

Plug 'kassio/neoterm'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

"" Git relate plugins

Plug 'airblade/vim-gitgutter'

"Plug 'tpope/vim-fugitive'

"Plug 'jreybert/vimagit'

Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'

""

Plug 'junegunn/gv.vim'

Plug 'vim-airline/vim-airline'

Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

Plug 'kannokanno/previm'

Plug 'tyru/open-browser.vim'

Plug 'alaviss/nim.nvim'

Plug 'dense-analysis/ale'

Plug 'osyo-manga/vim-watchdogs'

Plug 'fatih/vim-go' " for golang

Plug 'JuliaEditorSupport/julia-vim' " for julia

"Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'sebdah/vim-delve'

Plug 'tomasr/molokai'

Plug 'fmoralesc/molokayo'

Plug 'tpope/vim-rails'

Plug 'tpope/vim-endwise'

Plug 'numkil/ag.nvim'

Plug 'thinca/vim-ref'

Plug 'easymotion/vim-easymotion'

Plug 'scrooloose/syntastic'

" Debbugger
Plug 'puremourning/vimspector'
" Debugger

Plug 'rust-lang/rust.vim'

"Plug 'iberianpig/tig-explorer.vim'

"Plug 'davidhalter/jedi-vim'

"Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Terraform
Plug 'hashivim/vim-terraform'
" Terraform

" minizinc
Plug 'vale1410/vim-minizinc'
" minizinc

" svelte
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
" svelte


call plug#end()

colorscheme embark

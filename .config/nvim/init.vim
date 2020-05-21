let g:indent_guides_enable_on_vim_startup = 1

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open'

nnoremap <C-y> :call LanguageClient_contextMenu()<CR>
let g:LanguageClient_serverCommands = {
      \ 'nim': ['~/.nimble/bin/nimlsp'],
      \ }

map <C-n> :NERDTreeToggle<CR>

set number

set list

set tabstop=2

set shiftwidth=2

set expandtab

set tags=tags;/,codex.tags;/

set termguicolors

set background=dark

set encoding=utf-8

set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

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

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>

nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" control tabs
nnoremap <C-t>o :tabe %<CR>
nnoremap <C-t>p :tabp<CR>
nnoremap <C-t>b :tabn<CR>

nmap <leader>= :TagbarToggle<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>/ :BLines<CR>
tnoremap <silent> <ESC> <C-\><C-n>

let g:tagbar_autofocus = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })

call plug#begin('~/.local/share/nvim/plugged')

Plug 'prabirshrestha/asyncomplete.vim'

Plug 'Shougo/denite.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Shougo/echodoc.vim'

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/nerdcommenter'

Plug 'majutsushi/tagbar'

Plug 'kassio/neoterm'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/gv.vim'

Plug 'vim-airline/vim-airline'

Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

Plug 'kannokanno/previm'

Plug 'tyru/open-browser.vim'

Plug 'alaviss/nim.nvim'

Plug 'osyo-manga/vim-watchdogs'

Plug 'fatih/vim-go' " for golang

Plug 'JuliaEditorSupport/julia-vim' " for julia

" Plug 'leafgarland/typescript-vim'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'sebdah/vim-delve'

Plug 'tomasr/molokai'

Plug 'fmoralesc/molokayo'

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

call plug#end()

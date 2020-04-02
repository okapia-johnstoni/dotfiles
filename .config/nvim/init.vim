let g:LanguageClient_serverCommands = {
	\ 'haskell': ['hie', '--lsp'],
  \ 'go': ['gopls'],
	\ }

let g:LanguageClient_autoStart = 1

let g:deoplete#enable_at_startup = 1

let g:indent_guides_enable_on_vim_startup = 1

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open'

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

nnoremap <C-t>o :tabe %<CR>
nnoremap <C-t>p :tabp<CR>
nnoremap <C-t>b :tabn<CR>

nmap <leader>= :TagbarToggle<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>/ :BLines<CR>

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

let g:tagbar_autofocus = 1

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/denite.nvim'

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }

Plug 'Shougo/echodoc.vim'

Plug 'scrooloose/nerdtree'

" Plug 'dag/vim2hs'

Plug 'scrooloose/nerdcommenter'

Plug 'majutsushi/tagbar'

Plug 'kassio/neoterm'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'plasticboy/vim-markdown'

Plug 'kannokanno/previm'

Plug 'tyru/open-browser.vim'

Plug 'alaviss/nim.nvim'

Plug 'osyo-manga/vim-watchdogs'

Plug 'w0rp/ale'

Plug 'prabirshrestha/async.vim'

Plug 'prabirshrestha/asyncomplete.vim'

" Plug 'prabirshrestha/vim-lsp'

Plug 'fatih/vim-go'

Plug 'JuliaEditorSupport/julia-vim'

" Plug 'leafgarland/typescript-vim'

Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

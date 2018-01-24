let g:LanguageClient_serverCommands = {
	\ 'haskell': ['hie', '--lsp'],
	\ }

let g:LanguageClient_autoStart = 1

let g:deoplete#enable_at_startup = 1

let g:indent_guides_enable_on_vim_startup = 1

map <C-n> :NERDTreeToggle<CR>

set number

set list

set tabstop=4

set shiftwidth=4

set expandtab

set tags=tags;/,codex.tags;/

set termguicolors

set background=dark

let mapleader = ","

nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>

nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

nmap <leader>= :TagbarToggle<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>/ :BLines<CR>

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

let g:tagbar_autofocus = 1

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
    \ }

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/denite.nvim'

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'roxma/nvim-completion-manager'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/echodoc.vim'

Plug 'scrooloose/nerdtree'

Plug 'dag/vim2hs'

Plug 'scrooloose/nerdcommenter'

Plug 'majutsushi/tagbar'

Plug 'kassio/neoterm'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

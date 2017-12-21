let g:LanguageClient_serverCommands = {
	\ 'haskell': ['hie', '--lsp'],
	\ }
let g:LanguageClient_autoStart = 1

let g:deoplete#enable_at_startup = 1

map <C-n> :NERDTreeToggle<CR>

call plug#begin('~/.local/share/nvim/plugged')

set number

set list

set tabstop=4

set expandtab

Plug 'junegunn/fzf'

Plug 'Shougo/denite.nvim'

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'roxma/nvim-completion-manager'

Plug 'Shougo/echodoc.vim'

Plug 'scrooloose/nerdtree'

call plug#end()

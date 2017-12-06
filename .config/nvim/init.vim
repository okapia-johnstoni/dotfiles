let g:LanguageClient_serverCommands = {
	\ 'haskell': ['hie', '--lsp'],
	\ }
let g:LanguageClient_autoStart = 1

let g:deoplete#enable_at_startup = 1

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf'

Plug 'Shougo/denite.nvim'

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'roxma/nvim-completion-manager'

Plug 'Shougo/echodoc.vim'

call plug#end()

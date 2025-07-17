vim.cmd [[
filetype on
]]

-- vimspector
vim.g.vimspector_base_dir = '/Users/okazaki/.local/share/nvim/plugged/vimspector'
-- vimspector

vim.g.indent_guides_enable_on_vim_startup = 1
-- vim.cmd('au BufRead,BufNewFile *.md set filetype=markdown')
vim.g.previm_open_cmd = 'open'
vim.g['airline#extensions#ale#enabled'] = 1
vim.g['airline#extensions#tabline#enabled'] = 1

vim.g.mapleader = ","
vim.o.number = true
vim.o.relativenumber = true
vim.o.list = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.tags="tags;/,codex.tags;/"
vim.o.termguicolors = true
vim.o.background="dark"
vim.o.encoding="UTF-8"
vim.o.fileencodings = "utf-8,iso-2022-jp,euc-jp,sjis"
vim.o.clipboard = "unnamedplus"
vim.o.mouse="a"
vim.o.foldenable = false

-- " remove trailing spaces on saving file
vim.cmd [[
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

autocmd FileType ruby map <C-c> :w<CR>:!ruby -c %<CR>
]]

vim.cmd [[
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf
]]
-- " Use tab for trigger completion with characters ahead and navigate.
-- " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- " other plugin before putting this into your config.

-- vim.keymap.set('i', '<silent><expr>', '<TAB>
--       \ pumvisible() ? "\<C-n>" :
--       \ <SID>check_back_space() ? "\<TAB>" :
--       \ coc#refresh()'
--       )
vim.keymap.set('i', '<expr><S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"')

-- "nnoremap <C-y> :call LanguageClient_contextMenu()<CR>
-- "let g:LanguageClient_serverCommands = {
-- "      \ 'nim': ['~/.nimble/bin/nimlsp'],
-- "      \ }

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
-- vim.g.NERDTreeGitStatusUseNerdFonts = 1 --you should install nerdfonts by yourself. default: 0

vim.keymap.set('n', '<C-h>', ':vsp<CR>')
vim.keymap.set('n', '<C-k>', ':split<CR>')
vim.keymap.set('n', '<C-c>', ':close<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<C-t>o', ':tabe %<CR>')
vim.keymap.set('n', '<C-t>b', ':tabn<CR>')
vim.keymap.set('n', '<C-b>', '<Plug>AirlineSelectPrevTab', {remap = true})
vim.keymap.set('n', '<C-p>', '<Plug>AirlineSelectNextTab', {remap = true})

vim.keymap.set('n', '<leader>b', ':FzfLua buffers<CR>', {remap = true})
vim.keymap.set('n', '<leader>/', ':FzfLua blines<CR>', {remap = true})
vim.keymap.set('n', '<leader>q', ':FzfLua quickfix<CR>', {remap = true})
vim.keymap.set('n', '<leader>c', ':FzfLua commands<CR>', {remap = true})
vim.keymap.set('n', '<ESC>', '<C-\\><C-n>', {silent = true})
-- vim.keymap.set('n', '<leader>m', '<Plug>(coc-rename)', {remap = true})
-- " GoTo code navigation.
-- vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true, remap=true })
-- vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', {silent=true, remap=true})
-- vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {silent=true, remap=true})
-- vim.keymap.set('n', 'gr', '<Plug>(coc-references)', {silent=true, remap=true})

-- " <Leader>f{char} to move to {char}
vim.keymap.set('', '<Leader>f', '<Plug>(easymotion-bd-f)', { remap = true })
vim.keymap.set('n', '<Leader>f', '<Plug>(easymotion-overwin-f)', { remap = true })

-- " s{char}{char} to move to {char}{char}
vim.keymap.set('n', 's', '<Plug>(easymotion-overwin-f2)', { remap = true })
vim.keymap.set('v', 's', '<Plug>(easymotion-bd-f2)', { remap = true })

-- " Move to line
vim.keymap.set('', '<Leader>L', '<Plug>(easymotion-bd-jk)', { remap = true })
vim.keymap.set('n', '<Leader>L', '<Plug>(easymotion-overwin-line)', { remap = true })

-- " Move to word
vim.keymap.set('', '<Leader>w', '<Plug>(easymotion-bd-w)', { remap = true })
vim.keymap.set('n', '<Leader>w', '<Plug>(easymotion-overwin-w)', {remap = true})

vim.keymap.set('i', 'jj', '<ESC>', { silent = true })

-- " vimspector
vim.keymap.set('n', '<Leader>dd', ':call vimspector#Launch()<CR>')
vim.keymap.set('n', '<Leader>de', ':call vimspector#Reset()<CR>')
vim.keymap.set('n', '<Leader>dc', ':call vimspector#Continue()<CR>')

vim.keymap.set('n', '<Leader>dt', ':call vimspector#ToggleBreakpoint()<CR>')
vim.keymap.set('n', '<Leader>dT', ':call vimspector#ClearBreakpoints()<CR>')

vim.keymap.set('n', '<Leader>dk', '<Plug>VimspectorRestart', {remap = true})
vim.keymap.set('n', '<Leader>dh', '<Plug>VimspectorStepOut', {remap = true})
vim.keymap.set('n', '<Leader>dl', '<Plug>VimspectorStepInto', {remap = true})
vim.keymap.set('n', '<Leader>dj', '<Plug>VimspectorStepOver', {remap = true})

-- " vimspector
vim.g.go_def_mode='gopls'
vim.g.go_info_mode='gopls'
vim.g.ref_refe_encoding = 'euc-jp'

-- "let $NVIM_COC_LOG_LEVEL = 'info'
vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0
-- "let g:terraform_completion_keys = 1
-- "let g:terraform_registry_module_completion = 0

vim.g.terraform_fmt_on_save = 1

--
-- "au User asyncomplete_setup call asyncomplete#register_source({
-- "    \ 'name': 'nim',
-- "    \ 'whitelist': ['nim'],
-- "    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
--
vim.g.ale_linters = {
  nim= {'nimlsp', 'nimcheck'},
--  'python': ['flake8', 'mypy', 'black'],
  python= {'ruff'},
  rust= {'clippy'},
  ruby= {'rubocop'},
}
vim.g.ale_python_auto_virtualenv = 1
vim.g.ale_python_ruff_change_directory = 1

vim.g.ale_fixers = {
  _= {'remove_trailing_lines', 'trim_whitespace'},
  nim= {'nimpretty'},
  rust= {'rustfmt'},
  python= {'isort', 'black'},
--   'python': ['ruff'],
  ruby= {'rubocop'},
}
vim.g.ale_ruby_rubocop_options = '-a'
vim.g.ale_linters_explicit = 1
vim.g.ale_set_loclist = 0
vim.g.ale_set_quickfix = 0
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = '✖✖'
vim.g.ale_sign_warning = '⚠⚠'

vim.api.nvim_create_autocmd({"BufReadPost"}, { pattern = {"*"}, callback = function()
  vim.api.nvim_exec('silent! normal! g`"zv', false)
end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
    pattern = "*",
    callback = function()
        for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.api.nvim_win_get_config(winid).zindex then
                return
            end
        end
        vim.diagnostic.open_float({
            scope = "cursor",
            focusable = false,
            close_events = {
                "CursorMoved",
                "CursorMovedI",
                "BufHidden",
                "InsertCharPre",
                "WinLeave",
            },
        })
    end
})

vim.cmd [[
highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow
]]

local Plug = vim.fn['plug#']

vim.cmd [[
  call plug#begin('~/.local/share/nvim/plugged')
]]

--"Plug 'prabirshrestha/asyncomplete.vim'

Plug 'Shougo/denite.nvim'

-- Plug('neoclide/coc.nvim', {branch= 'release'})

Plug 'Shougo/echodoc.vim'

-- Plug 'scrooloose/nerdtree'
-- Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'scrooloose/nerdcommenter'

Plug 'ryanoasis/vim-devicons'

Plug 'skbolton/embark'

Plug 'kassio/neoterm'

-- Plug 'junegunn/fzf'
Plug('ibhagwan/fzf-lua', {branch= 'main'})
Plug 'nvim-tree/nvim-web-devicons'

--"" Git relate plugins
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

--"Plug 'jreybert/vimagit'

Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'

Plug("williamboman/mason.nvim", {['tag'] = 'v1.11.0'})
Plug("williamboman/mason-lspconfig.nvim", {['tag'] = 'v1.11.0'})

Plug 'neovim/nvim-lspconfig'

Plug 'junegunn/gv.vim'

Plug 'vim-airline/vim-airline'

Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

Plug 'kannokanno/previm'

Plug 'tyru/open-browser.vim'

Plug 'alaviss/nim.nvim'

Plug 'dense-analysis/ale'

Plug 'osyo-manga/vim-watchdogs'

Plug 'fatih/vim-go' --" for golang

Plug 'JuliaEditorSupport/julia-vim' --" for julia

--"Plug 'leafgarland/typescript-vim'
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

-- Plug 'scrooloose/syntastic'

-- " Debbugger
Plug 'puremourning/vimspector'
-- " Debugger

Plug 'simrat39/rust-tools.nvim'

-- "Plug 'iberianpig/tig-explorer.vim'
-- "Plug 'davidhalter/jedi-vim'
-- "Plug 'mg979/vim-visual-multi', {'branch': 'master'}

-- " Terraform
Plug 'hashivim/vim-terraform'
-- " Terraform

-- " minizinc
-- Plug 'vale1410/vim-minizinc'
-- " minizinc

-- " svelte
-- Plug 'othree/html5.vim'
-- Plug 'pangloss/vim-javascript'
-- Plug 'evanleck/vim-svelte', {'branch': 'main'}
-- " svelte

-- lua base
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'onsails/lspkind.nvim'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'

vim.call('plug#end')

vim.cmd [[
colorscheme embark
]]
vim.g.lazyvim_python_ruff = "ruff"
require('lspconfig').ruff.setup({
  init_options = {
    settings = {
      logLevel = 'info',
      configurationPreference = "filesystemFirst",
    }
  }
})
require('lspconfig').pyright.setup({
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { '*' },
      }
    }
  }
})

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

require("CopilotChat").setup {
}

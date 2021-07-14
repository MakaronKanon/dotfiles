" Use vim-plug as plugin manager, with plugins installed in the plugged
" folder.
call plug#begin("~/.config/nvim/plugged")

" Nice status- and tabline.
Plug 'vim-airline/vim-airline'

" Use gruvbox theme.
" Plug 'morhetz/gruvbox'
Plug 'dkasak/gruvbox'
Plug 'sainnhe/gruvbox-material'

" Use VimWiki to organize notes.
Plug 'vimwiki/vimwiki'

" Use coc to interact with language servers
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use syntax highlightning for haskell
Plug 'neovimhaskell/haskell-vim'

" Use syntax highlightning for dart
Plug 'dart-lang/dart-vim-plugin'

" For manage files, and search in files. FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" For comments
Plug 'tpope/vim-commentary'

" For telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" For treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  

" For vim fugitive
Plug 'tpope/vim-fugitive'

" Use lspconfig
Plug 'neovim/nvim-lspconfig'

" Autocomplete
Plug 'hrsh7th/nvim-compe'

" Plug 'airblade/vim-gitgutter'

Plug 'ntpeters/vim-better-whitespace'

Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua'}

" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'puremourning/vimspector'

Plug 'ryanoasis/vim-devicons'

Plug 'lewis6991/gitsigns.nvim'

Plug 'jiangmiao/auto-pairs'

Plug 'zivyangll/git-blame.vim'

call plug#end()

let g:vimspector_enable_mappings = 'HUMAN'

" Show linenumbers.
set number

" Use relative line numbers.
set number relativenumber

" Whenever a tab is entered, replace it with spaces.
set expandtab
" A tab should be shown as 2 spaces, inserting a tab will insert two spaces.
set tabstop=2
" Indenting should use 2 spaces.
set shiftwidth=2

autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

" Enable true (24 bits) colors.
set termguicolors

" Set theme to gruvbox.
colorscheme gruvbox-material

" Use space as mapleador to easily access shortcuts.
let mapleader = " "

" Clipboard between vim and system.
set clipboard=unnamedplus

" When switching buffers, don't prompt if any changes are made.
set hidden

" For searching
set ignorecase
set smartcase

" Autoscroll when to much up or down
set scrolloff=8

set noswapfile

" Use tab to navigate completion list down.
" Use shift tab to navigate completion list up.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Easy to edit vim config file
nnoremap <Leader>vv :e $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<CR>


" Quick fix
" nmap <leader>a  <Plug>(coc-codeaction)
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Open file browser
nnoremap <leader>pp :Files<Cr>

" Open buffer browser
nnoremap <leader>pb :Buffers<Cr>

" Find a file
nnoremap <leader>ff <cmd>Telescope find_files<cr>

nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <leader>fb <cmd>Telescope buffers<cr>

nnoremap <leader>ft <cmd>Telescope treesitter<cr>

nnoremap <leader>frc <cmd>lua require('telescope.builtin').git_files({promt_title = "< Dotfiles >", hidden=true, cwd = "$HOME/.dotfiles"})<cr>



" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

set termguicolors

lua << EOF
require'lspconfig'.intelephense.setup{}
EOF

lua << EOF
require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_delay = 1000,
  current_line_blame_position = 'eol',
}
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "intelephense"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = false,
  },
  indent = {
    enable = false,
  }
}
EOF

" Vim gutter update left symbols in 100ms intervals
set updatetime=100

let g:indent_blankline_space_char = '·'
let g:indent_blankline_char = '│'



nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

lua << EOF
require'lspconfig'.pyright.setup{}
EOF

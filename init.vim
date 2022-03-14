set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.config/nvim/plugin/maps.vim

call plug#begin()
  Plug 'SirVer/ultisnips'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'fatih/vim-go'
  Plug 'leafgarland/typescript-vim'
  Plug 'lervag/vimtex'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'preservim/nerdcommenter'
  Plug 'sainnhe/sonokai'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'sbdchd/neoformat'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'

if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'neovim/nvim-lspconfig'
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
endif
call plug#end()

colorscheme sonokai

let mapleader = " "
let maplocalleader = " "
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'

"let g:completion_enable_snippet='UltiSnips'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:coq_settings = { 'auto_start': v:true }

let g:python3_host_prog = '/usr/local/bin/python3'

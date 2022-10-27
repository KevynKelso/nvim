set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.config/nvim/plugin/sets.vim
source ~/.config/nvim/plugin/autocmds.vim
source ~/.config/nvim/plugin/maps.vim
source ~/.config/nvim/plugin/lspconfig.rc.vim

call plug#begin()
  Plug 'SirVer/ultisnips'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'sainnhe/sonokai'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'

if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'neovim/nvim-lspconfig'
endif
call plug#end()

set background=dark
let g:sonokai_style = 'atlantis' 
let g:sonokai_better_performance = 1
let g:airline_theme = 'distinguished'
let g:airline#extensions#tabline#enabled = 1
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 0
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline_skip_empty_sections = 1
colorscheme sonokai

let mapleader = " "
let maplocalleader = " "

let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:coq_settings = { 'auto_start': 'shut-up' }

let $FZF_DEFAULT_OPTS = '--reverse'

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
-- Using this option may slow down your editor, and you may see some duplicate highlights.
-- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF
"let g:python3_host_prog = '/usr/local/bin/python3'

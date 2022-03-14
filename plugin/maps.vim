" Mappings
"
"
"
"
" Telescope
" test
"
nnoremap <leader>F <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" centering
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z
" jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
" undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <silent>y<Leader>f :let @* = expand("%")<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
noremap <Leader>s :UltiSnipsEdit<CR>
nnoremap <Leader>w :wa<CR>
nnoremap dl dt)
nnoremap <Leader>N :cprevious<CR>
nnoremap <Leader>n :cnext<CR>
tnoremap <Esc> <C-\><C-n>
vnoremap <leader>k "ky :!echo "<c-R>k" \| nc localhost 10004<CR>
 "vim fugitive
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
" blog
nnoremap <leader>ts idate: "<esc>:put =strftime('%FT%T%z')<cr><esc>kJA"<esc>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" python
nnoremap <leader>0 :!python3.9 /Users/vyn/projects/beacon-loc/test/main.py<CR>
map <c-_> <Plug>NERDCommenterToggle
" running files
autocmd FileType cpp             nnoremap <buffer> <Leader>v :let @v=@%<CR>:vsp<CR>:term<CR>Ag++ <C-\><C-n>"vpA -o a.out && ./a.out<CR>
autocmd FileType python          nnoremap <buffer> <Leader>v :let @v=@%<CR>:vsp<CR>:term<CR>Apython3 <C-\><C-n>"vpA<CR>
autocmd FileType markdown          nnoremap <buffer> <Leader>v :let @v=@%<CR>:vsp<CR>:term<CR>Aglow <C-\><C-n>"vpA<CR>

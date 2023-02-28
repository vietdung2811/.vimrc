syntax on
filetype plugin indent on
set ts=2 sts=2 sw=2 et ai si
set rnu

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
map <F9> :!g++ -g % -o %:r && ./%:r <CR>
map <F5> :!g++ -g % -o %:r <CR>
map <F2> :w <CR>
map <F12> :!gdb ./%:r <CR>
map <C-a> gg v G
map <C-c> "+y
map <C-h> :.,$s/min//g
" map <C-_> :s/^/\/\//<Enter>
" map <C-u> :s/^\/\///<Enter>

call plug#begin()

Plug 'neoclide/coc.nvim'
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'

call plug#end()

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

set termguicolors
colo gruvbox

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>


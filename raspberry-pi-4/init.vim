"========================================================="
" Plugin manager
" junegunn/vim-plug
"========================================================="
call plug#begin(stdpath('data') . '/plugged')

  " Completion and language extensions
  Plug 'neoclide/coc.nvim', {'branch':'release'}
  let g:coc_global_extensions = [
    \'coc-tsserver',
    \'coc-python',
    \ 'coc-pydocstring',
    \ 'coc-json',
    \ 'coc-html-css-support',
    \ 'coc-css',
    \ 'coc-sql',
    \ 'coc-prettier',
    \ 'coc-yaml'
    \]

  " FZF on ^p
  " Configured below to use silver-searcher
  Plug 'junegunn/fzf', {'do': { -> fzf#install()  } }
  Plug 'junegunn/fzf.vim'

  " Seamless vim/tmux split navigation on ^h ^j ^k ^l
  Plug 'christoomey/vim-tmux-navigator'

  " Syntax highlighting
  Plug 'pangloss/vim-javascript'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'leafgarland/typescript-vim'

  " Prettier on save
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

  " Quality of life
  Plug 'jiangmiao/auto-pairs'
  Plug 'chrisbra/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'machakann/vim-highlightedyank'

  " UI and visual improvements
  Plug 'dracula/vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

"========================================================="
" Plugin configuration
"========================================================="
" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:webdevicons_conceal_nerdtree_brackets = 1
" Show on launch with autocommands
autocmd vimenter * :NERDTree
autocmd vimenter * wincmd l
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

" CoC tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"========================================================="
" Preferences
"========================================================="
colorscheme dracula

set number relativenumber
set ignorecase
set inccommand=split
set splitright
set splitbelow
set winminheight=0

" Indenting
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set tabstop=2
set softtabstop=2

" Proper colors
if (has("termguicolors"))
  set termguicolors
endif

"========================================================="
" Key bindings
"========================================================="
" Space as leader
let mapleader = " "

" Leader bindings
nmap <silent> <leader>v :source ~/.config/nvim/init.vim<CR>
nmap <leader>j <Plug>(coc-diagnostic-next)
nmap <leader>k <Plug>(coc-diagnostic-prev)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

" ^b - NERDTreeToggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" ^p - Fuzzy find
nnoremap <silent> <C-p> :FZF<CR>

" Mash at j & k to leave insert mode
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap kk <Esc>

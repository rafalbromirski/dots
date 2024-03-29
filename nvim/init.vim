" --- Plugins ------------------------------------------------------------------

" Begin
call plug#begin('~/.vim/plugged')

" General
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-sort-motion'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Linter
Plug 'dense-analysis/ale'

" Formatting
Plug 'sbdchd/neoformat'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CocInstall coc-tsserver

" vim-lsp
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Clojure
Plug 'tpope/vim-fireplace'

" Go
Plug 'fatih/vim-go'

" Syntax
Plug 'sheerun/vim-polyglot'
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'wuelnerdotexe/vim-astro'

" Themes
Plug 'rafalbromirski/vim-aurora'

" Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Prettier
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': [
      \ 'javascript',
      \ 'javascriptreact',
      \ 'typescript',
      \ 'typescriptreact',
      \ 'css',
      \ 'less',
      \ 'scss',
      \ 'json',
      \ 'graphql',
      \ 'vue',
      \ 'lua',
      \ 'php',
      \ 'python' ] }

" JSDocs
Plug 'heavenshell/vim-jsdoc', {
      \ 'for': ['javascript', 'javascript.jsx','typescript'],
      \ 'do': 'make install'
      \ }

call plug#end()

" --- General ------------------------------------------------------------------

set shell=zsh
set encoding=utf-8
set termencoding=utf-8
set spelllang=en_gb

set modeline
set modelines=10
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set nowrap
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.orig,.pdf,*.DS_Store
set wildignore+=*/.sass-cache/*,*/tmp/*,*/node_modules/*,*/bower_components/*,*/.next/*,*/coverage/*
set clipboard+=unnamed
set number
set ruler
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set nocursorline
set nocursorcolumn
set scrolljump=5
set linebreak
set showbreak=...
set keymodel=startsel,stopsel
set ttyfast
set listchars=tab:\ \ ,trail:·,extends:>,precedes:<
set list
set novisualbell
set noerrorbells
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set foldmethod=manual
set switchbuf=usetab,newtab
set lazyredraw
set vb t_vb=
set synmaxcol=400
set nocompatible
set colorcolumn=120
set t_Co=256

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" split settings
set splitright
set splitbelow

" hide buffers when not displayed
set hidden
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backup    " Where backups will go.
set directory=~/.vim/tmp       " Where temporary files will go.
set noswapfile

" indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" set autoindent

" mouse settings
set mousehide
set mouse=a
set fo=1

" help W11 - do not show a message when file has been changed
set autoread

" --- GUI ----------------------------------------------------------------------

" MacVim config
if has("gui_macvim")
  " Use the normal HIG movements, except for M-Up/Down
  let macvim_skip_cmd_opt_movement = 1
  set guifont=Monaco\ For\ Powerline:h13

  " different cursors for different modes.
  set guicursor=n-c:block-Cursor-blinkon0
  set guicursor+=v:block-vCursor-blinkon0
  " set antialias

  " better vim tabs
  set guioptions=A
end

" This is only necessary if you use 'set termguicolors'
" It fixes tmux+vim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
set background=dark
colorscheme aurora
" colorscheme catppuccin

" --- GUI: statusline ----------------------------------------------------------

" visible statusline
set laststatus=2

" statusline
function! CurrentMode()
  let l:mode = mode()

  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  endif
endfunction

function! StatuslineMode()
  let l:mode = CurrentMode()

  return '['.l:mode.']'
endfunction

set statusline=
" [MODE]
set statusline+=%{StatuslineMode()}
" file path
set statusline+=\ %f
" [+]/[-]
set statusline+=%m
" spacer
set statusline+=%=
" col / row
set statusline+=%l\:%c
" file type
set statusline+=\ %y
" file encoding
set statusline+=[%{&fileencoding?&fileencoding:&encoding}]
" file format
set statusline+=[%{&fileformat}]

" --- Bindings -----------------------------------------------------------------

" totally annoying default mapping for cap k
" nmap K <nop>

" ; => ;
nnoremap ; :

" Better ESC key
imap jk <ESC>

" copy paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

" duplicate current line
nnoremap <D-d> Yp

"f# keys
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" shift key fixes
if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

" yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" moving lines
nnoremap <D-DOWN> :m+<CR>==
nnoremap <D-UP> :m-2<CR>==
inoremap <D-DOWN> <Esc>:m+<CR>==gi
inoremap <D-UP> <Esc>:m-2<CR>==gi
vnoremap <D-DOWN> :m'>+<CR>gv=gv
vnoremap <D-UP> :m-2<CR>gv=gv

" cycle tabs with <CTRL><Left> and <CTRL><Right>
nnoremap <D-Left> :tabprev<CR>
nnoremap <D-Right> :tabnext<CR>

" Navigate between splits <TAB> / <SHIFT+TAB>
nnoremap <Tab> <c-w><c-w>
nnoremap <s-Tab> <c-w><s-w>

nnoremap <D->> :vertical resize +10<CR>
nnoremap <D-<> :vertical resize -10<CR>

" keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" tab only
nnoremap ,o :tabo<CR>

" spellcheck
nnoremap ,s :setlocal spell! spell?<CR>

" eslint fix
nnoremap ,e :ALEFix eslint<CR>

" terminal (vsplit)
nnoremap ,t :vert term<CR>

" set curosrline / column (crosshair)
nnoremap ,c :set cursorline! cursorcolumn!<CR>

" nerdtree
noremap ,d :NERDTreeToggle<cr>
noremap ,f :NERDTreeFind<cr>

" splits
noremap ,v :vsp^<cr>
noremap ,h :split^<cr>

" copy file path to clipboard
noremap ,y :let @+ = expand("%")<CR>

" open vimrc
nnoremap ,1 :edit $MYVIMRC<CR>

" run love2d
nnoremap ,l :silent exec "!love ."<CR>

" --- Plugins: config ----------------------------------------------------------

" hexokinase
let g:Hexokinase_optInPatterns = 'triple_hex,full_hex,rgb,rgba,hsl,hsla'
let g:Hexokinase_highlighters = ['backgroundfull']

" gitgutter
let g:gitgutter_eager = 0
let g:gitgutter_enabled = 1
let g:gitgutter_max_signs = 1000

augroup plugin_gitgutter
  autocmd!
  autocmd BufWritePost * exe 'GitGutter'
augroup END

" fzf
let g:fzf_preview_window = ''
let g:fzf_layout = { 'down': '~30%' }

noremap ,jj :Files<CR>
nnoremap <leader>f :Ag <C-R><C-W><CR>

" nerdtree
augroup plugin_nerdtree
  autocmd!
  autocmd Filetype nerdtree setlocal nolist
augroup END

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
      \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
      \ '.*\.o$', 'db.db', 'tags.bak']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'

" vim-closetag
let g:closetag_filenames = "*.html,*.js,*.tsx,*.ts"
let g:closetag_xhtml_filenames = '*.html,*.jsx,*.js,*.tsx,*.ts'

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 0
let g:go_highlight_format_strings = 0
let g:go_highlight_function_parameters = 0
let g:go_highlight_generate_tags = 0
let g:go_highlight_variable_assignments = 0

" vim-astro
let g:astro_typescript = 'enable'

" lsp
" let g:lsp_diagnostics_virtual_text_enabled = 0

" if executable('pylsp')
"   " pip install python-lsp-server
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'pylsp',
"         \ 'cmd': {server_info->['pylsp']},
"         \ 'allowlist': ['python'],
"         \ })
" endif

" function! s:on_lsp_buffer_enabled() abort
"   setlocal omnifunc=lsp#complete
"   setlocal signcolumn=yes
"   if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"   nmap <buffer> gd <plug>(lsp-definition)
"   " nmap <buffer> gs <plug>(lsp-document-symbol-search)
"   " nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"   nmap <buffer> gr <plug>(lsp-references)
"   nmap <buffer> gi <plug>(lsp-implementation)
"   nmap <buffer> gt <plug>(lsp-type-definition)
"   nmap <buffer> <leader>rn <plug>(lsp-rename)
"   nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"   nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"   nmap <buffer> K <plug>(lsp-hover)
"   nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
"   nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

"   let g:lsp_format_sync_timeout = 1000
"   autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

"   " refer to doc to add more commands
" endfunction

" augroup lsp_install
"   au!
"   " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"   autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END

" if executable('typescript-language-server')
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'typescript-language-server',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"         \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"         \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact'],
"         \ })
" endif

" coc
let g:coc_global_extensions = ['coc-tsserver']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" ale/linter
" let g:ale_virtualtext_cursor = 'disabled'

let g:ale_linters = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['prettier', 'eslint'],
      \ }

let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['prettier'],
      \ }

" vim-prettier
augroup plugin_prettier
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue Prettier
augroup END

" avoid wrapping a single arrow function param in parens
" avoid|always
" default: 'avoid'
let g:prettier#config#arrow_parens = get(g:,'prettier#config#arrow_parens', 'always')
let g:prettier#config#jsx_bracket_same_line = get(g:,'prettier#config#jsx_bracket_same_line', 'false')

" --- Editor: utils ------------------------------------------------------------

function! StripTrailingWhitespace()
  " Don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif

  if &ft =~ 'html.handlebars'
    return
  endif

  %s/\s\+$//e
endfun

augroup editor
  autocmd!
  " remove white space on save
  autocmd BufWritePre * call StripTrailingWhitespace()
  " Reload vimrc on save
  autocmd BufWritePost .vimrc source %
  " Save when losing focus
  autocmd FocusLost * :silent! wall
  " Resize splits when the window is resized
  autocmd VimResized * :wincmd =
augroup END

augroup editor_syntax
  autocmd!
  " autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END

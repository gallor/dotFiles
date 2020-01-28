scriptencoding utf-8
set encoding=utf-8

 source ~/.config/nvim/plugins.vim

" -----------------------------------------------------------
" change mapleader from \ to ,
" -----------------------------------------------------------
let mapleader = ","

" -----------------------------------------------------------
"  Enable syntax highlighting
" -----------------------------------------------------------
syntax on
syntax sync minlines=200 " Syntax highlighting 200 lines instead of always from start
 
" -----------------------------------------------------------
" color settings
" -----------------------------------------------------------
set termguicolors " enable 256 colors in iterm
set background=dark
set t_Co=256 " enable 256 colors in non-iterm terminal
try
  let g:hybrid_custom_term_colors = 1
  let g:hybrid_reduced_contrast = 1
  colorscheme hybrid
  hi LineNr ctermbg=NONE ctermfg=247 guifg=#9e9e9e
  hi MatchParen guifg=#CDCDCD guibg=#60617A
  hi Todo guibg=#7C6798
catch
  try
    colorscheme monokai
    " Clearing all the italic gui
    hi jsFuncArgs gui=NONE
    hi jsFuncArgRest gui=NONE
    hi jsDocTags gui=NONE
    hi typescriptFuncType gui=NONE
    hi typescriptCall gui=NONE
    hi typescriptArrowFuncArg gui=NONE
  catch
  endtry
endtry

hi Error gui=underline
hi Normal ctermbg=NONE
hi EndOfBuffer ctermfg=252 guifg=#d0d0d0
hi CursorLine ctermbg=234 guibg=#1c1c1c
hi NonText ctermbg=NONE
hi Comment gui=NONE ctermfg=245 guifg=#8a8a8a
hi Visual ctermbg=237 guibg=#484A4D

" JS syntax highlighting
hi def link jsObjectKey Structure
hi def link jsObjectProp Tag


set synmaxcol=128
set termencoding=utf-8

" -----------------------------------------------------------
" Block for Command mode, underscore for insert
" -----------------------------------------------------------
let &t_SI = "\<Esc>]50;CursorShape=2\x7" " Underscore in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

" -----------------------------------------------------------
" Visual Updates
" -----------------------------------------------------------
filetype on " Enable file type detection
filetype plugin indent on " Enable filetype indentation
set tabstop=2 " 2 spaces
set shiftwidth=2 " Indenting with '>', use 2 spaces
set softtabstop=2 " 2 spaces tabbing when in insert mode
set autoindent " Keep the same indent as the line you're currently on
set smartindent " Smart indents for new lines
set nojoinspaces " Unset join spaces
set splitright " Opening splits to right
set splitbelow " Opening spluts below
set synmaxcol=250 " Setting syntax highlighting to the first 250 columns. Helps with speed for long lines
set scrolloff=3 "Scrolling visual offset to three lines
" set guifont=Inconsolata\ Nerd\ Font\ Complete\ Mono\ Windows\ Compatible:h11
set guifont=InconsolataGo\ Nerd\ Font\ Complete:h11

" set showmatch " Highlights the matching bracket/paren 
" hi MatchParen cterm=none ctermbg=green ctermfg=blue " to change the colors
" of the showmatch
set noshowmode " Don't show mode, airlien already shows it
set title " Show the filename in the window titlebar
set showcmd "Show the (partial) command as it's being typed
set hidden " Hides buffers instead of closing them
set cmdheight=2 " Command window height to 2 lines
set mouse=a " Enable mouse
set signcolumn=yes " aloways show signcolumns

" Change highlighting of bracket matching. cterm can be none, bold or underline
hi MatchParen cterm=underline ctermbg=none ctermfg=none
set hlsearch

" -----------------------------------------------------------
" Vim Funtionality
" -----------------------------------------------------------
set iskeyword -=_ " Underscores denote words
set ttimeoutlen=50 "Set shorter timeout to disable esc key combination
set ttyfast " Optimize for fast terminal connections
set wildmenu " Better command-line completion
set wildmode=list:longest " List all matches and complete till longest
set gdefault " Add the g flag to search/replace by default
set autoread " force vim to reload files if differ on disk
set updatetime=100 " time to write to swap file. improve experience for diagnostic messages
" Don't add empty newlines at the end of files
set binary
set noeol

set expandtab " On pressing tab, insert 4 spaces. Has to be after set binary so expandtab is not reset

set backspace=indent,eol,start " Backspace over autoindent, line breaks, and start of insert
set laststatus=2 " Always show status line
set shortmess=atI " Don't show the intro message when starting vim
set shortmess+=c " Don't give ins-completion-menu messages
"
" Very magic search mode all non [0-9] and [A-Z] must be escaped
nnoremap / /\v
vnoremap / /\v

set nofoldenable " disable folding on startup
set ignorecase " case insensitive search, except when using capital letters
set smartcase " if the search string has an upper case letter in it, the search will be case sensitive
set confirm " if the search string has an upper case letter in it, the search will be case sensitive
set incsearch " Searches are redefined as search term is typed

" Set backups
" if has('persistent_undo')
"   set undofile
"   set undolevels=3000
"   set undoreload=10000
" endif
" set backup
" set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
" set noswapfile
" Some coc servers have problems with backups
set nobackup
set nowritebackup

" -----------------------------------------------------------
" Key Remapping, Line Numbering
" -----------------------------------------------------------
nnoremap ; :
" set lazyredraw " fixes horizontal scrolling with relativenumber on
set relativenumber
set number

nnoremap <silent> <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Checks if any buffers were changed outside of vim. set autoread resets them
nnoremap <F5> :checktime<CR>

" set wrap
set wrap
set linebreak
set textwidth=90
set wrapmargin=0

" Disable arrow navigation
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <S-4> g$
nnoremap <S-6> g^

" Exit terminal input mode
au TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
au FileType fzf tunmap <buffer> <ESC>

" Create new horizontal split with terminal
nnoremap <C-q> :30sp<cr>:term<cr>i
" Create and switch to it vertical split
nnoremap <C-\> <C-w>v<C-w>l
" Create and switch to it horizontal split
nnoremap <leader>e :sp<C-w>j

" Remaps C-h/j/k/l to move around in the splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap buffer commands
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprev<cr>
nnoremap <leader>bq :bp <BAR> bd #<cr>
nnoremap <leader>bl :ls<cr>

" Close all open buffers save the last one
nnoremap <leader>bc :%bd\|e#<cr>

" Makes </ auto close HTML tag
" iabbrev </ </C-X><C-o>

" Shortcuts to open vimrc and plugin files
nnoremap <leader>vrc :e $HOME/.config/nvim/init.vim<cr>

" Strip Trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos('.')
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
nnoremap <leader>ss :call StripWhitespace()<CR>

function Foldsyn()
  set foldmethod=syntax
endfunction
function FoldIndent()
  set foldmethod=indent
endfunction
nnoremap <leader>zs :call Foldsyn()<CR>
nnoremap <leader>zs :call FoldIndent()<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
nnoremap <leader>sp :call <SID>SynStack()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
    " Treat .scss files as css
    " autocmd BufRead,BufNewFile *.scss set filetype=css syntax=css
    " autocmd BufRead,BufNewFile *.less set filetype=css syntax=css
    " autocmd FileType less set omnifunc=csscomplete#CompleteCSS
    " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
    " Set relative if enter buffer, or in visual/normal mode
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    " Set absolute if leaving buffer or in insert mode
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    "autocmd BufWinLeave *.* mkview
    "autocmd BufWinEnter *.* silent loadview
endif

" Add a Remove command
command! -complete=file -nargs=1 Trash :echo 'Trash: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

try
source ~/.config/nvim/pluginSettings.vim 
catch
    echo "Plugins didn't work" . v:exception
endtry
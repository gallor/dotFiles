" -----------------------------------------------------------
" Plugins
" -----------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')

"==== Editing ====="
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}} " JS Intellisense
" Plug 'Shougo/denite.nvim' " Fuzzy file searching
Plug '/usr/local/opt/fzf' " Fzf only if installed via homebrew
Plug 'junegunn/fzf.vim' " Fuzzy file searching
Plug 'Shougo/echodoc.vim' " Print function signatures in echo area
Plug 'easymotion/vim-easymotion' " Improved motion in Vim
" Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate' " insert mode auto completion
Plug 'tpope/vim-repeat' " repeat support for vim-surround
Plug 'tpope/vim-surround' " change 'surroundings'
Plug 'tpope/vim-obsession' " save nvim session 
Plug 'tpope/vim-eunuch' "Unix shell commands
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " markdown preview support
Plug 'rizzatti/dash.vim' " dash documentation
Plug 'jceb/vim-orgmode' " Org mode
Plug 'tmux-plugins/vim-tmux-focus-events' " Enable autoread for vim in tmux 
Plug 'vim-ctrlspace/vim-ctrlspace' " Workspace vim management 
Plug 'jremmen/vim-ripgrep' " search for words
Plug 'airblade/vim-rooter' " changes vim working directory to project root

" Tmux/Neovim movement integration
" Plug 'christoomey/vim-tmux-navigator'
"
" Snippet support
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
"
"==== Git ====="
Plug 'tpope/vim-fugitive' " add git operation commands
Plug 'airblade/vim-gitgutter' " git signage in gutter


"==== JS ===="
" Plug 'HerringtonDarkholme/yats.vim' " Typescript syntax highlighting
" Plug 'heavenshell/vim-jsdoc' " Generate JSDoc commands based on function signatures
Plug 'pangloss/vim-javascript' " JS highlighting and indenting
Plug 'greatghoul/vim-web-indent' 
" Plug 'othree/javascript-libraries-syntax.vim' " Syntax highlighting for javascript libraries
" Plug 'othree/yajs.vim' " Improved syntax highlighting and indentation

"==== Syntax ===="
Plug 'w0rp/ale' " linting engine engine
Plug 'sheerun/vim-polyglot' " Syntax engine loads libraries only on demand,

"==== UI ===="
Plug 'davidoc/taskpaper.vim' " Taskpaper support
Plug 'w0ng/vim-hybrid' " colorscheme
Plug 'vim-scripts/eclipse.vim' " colorscehme 
Plug 'vim-scripts/summerfruit256.vim' " colorscheme 
Plug 'crusoexia/vim-monokai' " colorschem 
Plug 'Yggdroot/indentLine' " Indent line guides 
Plug 'scrooloose/nerdtree' " File explorer
Plug 'scrooloose/nerdcommenter' " commenting
"
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

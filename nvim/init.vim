" GENERAL {
    " Set leader key to space
    let mapleader=" "
    " encoding
    set termencoding=utf-8
    set encoding=utf-8
    " remember more commands
    set history=1000
    " levels of undo command
    set undolevels=1000
    " no backup file :D
    set nobackup
    set noswapfile
    " hides the buffer instead of closing the files
    set hidden
    " ignore case when searching
    set ignorecase
    " show search matches as you type
    set incsearch
    " no sonds
    set visualbell
    set noerrorbells
    " let the cursor go anywhere
    set virtualedit=all
    " highlight search terms
    set hlsearch
    " make tab completion for files/buffers act like bash
    set wildmenu
    " show a list when pressing tab and complete
    set wildmode=list:longest,full
    " enable filetype plugins
    filetype plugin on
"}

" FORMATING / CODING {
    " disable absolute numbers
    set nonu
    " set relative number
    set relativenumber
    " show line numbers
    set number
    " dont wrap lines
    set nowrap
    " convert tab to spaces
    set expandtab
    " set tab to be 4 spaces
    set tabstop=4
    " allow backspace over everything in edit mode
    set backspace=indent,eol,start
    " set auto indent
    set autoindent
    " copy the previous indentation
    set copyindent
    " set 4 space for autoindenting
    set shiftwidth=4
    " set multiples of shiftwidth when indenting with '<'
    set shiftround
    " show the matching symbols
    set showmatch
    " set the identation on
    filetype plugin indent on
    " use case sensitive when the terms are not all in smallcase
    set smartcase
    "Sourced from vim tip: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
    set foldmethod=indent
    set foldlevel=0
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
    " Show invisible characters
    set list
    set listchars=tab:›\ ,eol:¬,trail:⋅,space:⋅
    " set syntax highlight ounitn
    syntax on
    " Fyle type specific
    " Javascript
    autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
    " Typescript
    autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2
    " YAML
    autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2
    " JSON
    autocmd FileType json setlocal shiftwidth=2 softtabstop=2
    " Kotlin
    autocmd BufReadPost *.kt setlocal filetype=kotlin
    " Remove trailing spaces
    autocmd BufWritePre * %s/\s\+$//e
" }

" PLUGINS {
    call plug#begin('~/.config/nvim/plugins')
    Plug 'ryanoasis/vim-devicons'
    " Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-surround'
    " Fuzzy Finder
    Plug 'kien/ctrlp.vim'
    " Git integration
    Plug 'tpope/vim-fugitive'
    " Information line at the bottom of the screen
    Plug 'vim-airline/vim-airline'
    " Themes for Airline
    Plug 'vim-airline/vim-airline-themes'
    " Snippets
    Plug 'honza/vim-snippets'
    Plug 'epilande/vim-react-snippets'
    " Language Server Language: Auto complete, documentation, jump to
    " reference, etc.
    Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
    " Symbol list/navigation
    Plug 'liuchengxu/vista.vim'
    Plug 'junegunn/fzf'
    " Shortcut to comment lines and blocks of code in multiple languages
    Plug 'scrooloose/nerdcommenter'
    " File explorer capabilities
    Plug 'preservim/nerdtree'
    " Engine for linting code in multiple languages
    Plug 'w0rp/ale'
    " Integrates with debuggers from multiple languages
    Plug 'joonty/vdebug'
    " Snipets engine
    Plug 'SirVer/ultisnips'
    " Testing
    Plug 'janko/vim-test'
    " PHP
    Plug 'phpactor/phpactor'
    " Python
    Plug 'Vimjas/vim-python-pep8-indent'
    " Javascript
    Plug 'joaohkfaria/vim-jest-snippets'
    " Javascript - React
    Plug 'mxw/vim-jsx'
    " Kotlin
    Plug 'udalov/kotlin-vim'
    " HTML
    Plug 'mattn/emmet-vim'
    " Themes
    Plug 'arcticicestudio/nord-vim'
    " Development Environment
    Plug 'christoomey/vim-tmux-navigator'
    call plug#end()

    " PLUGINS CONFIGURATION
    " {
        " COC {
            map <Leader>cjd :call CocActionAsync('jumpDefinition')<cr>
            map <Leader>cji :call CocActionAsync('jumpImplementation')<cr>
            map <Leader>cjl :call CocActionAsync('jumpDeclaration')<cr>
            map <Leader>cs :call CocActionAsync('showSignatureHelp')<cr>
            map <Leader>ch :call CocActionAsync('doHover')<cr>
            map <Leader>cr :call CocActionAsync('rename')<cr>
            map <Leader>cp :CocCommand prettier.formatFile<cr>
        " }
        " CNTRLP {
            let g:ctrlp_custom_ignore = 'git\|node_modules\|DS_store\|coverage'
            map <Leader>po <C-p>
        " }
        " EMMET {
            " Emmet activate
            map <Leader>ea
        " }
        " NERD COMMENTER {
            " Add spaces after comment delimiters by default
            let g:NERDSpaceDelims = 1
            map <Leader>nc <plug>NERDCommenterToggle<cr>
        " }
        " NERD COMMENTER {
            map <Leader>nt :NERDTreeToggleVCS<cr>
            map <Leader>ntr :NERDTreeRefreshRoot<cr>
        " }
        " VIM Fugitive {
            map <Leader>gb :Git blame<cr>
            map <Leader>gp :Git pull<cr>
            map <Leader>gl :Git log<cr>
            map <Leader>gc :Git commit<cr>
        " }
        " ULTISNIPS {
            let g:UltiSnipsExpandTrigger="<TAB>"
            let g:UltiSnipsJumpForwardTrigger="<TAB>"
        " }
        " VIM TEST {
            let test#strategy = "neovim"
            map <Leader>tn :TestNearest<CR>
            map <Leader>tf :TestFile<CR>
            map <Leader>ts :TestSuite<CR>
            map <Leader>tl :TestLast<CR>
            map <Leader>tv :TestVisit<CR>
        " }
        " AIRLINE {
            autocmd VimEnter * AirlineTheme nord
            let g:airline#extensions#coc#enabled = 0
            let g:airline#extensions#ale#enabled = 1
            let g:airline_powerline_fonts = 1
        " }
    " }
" }

" UI {
    " display incomplete commands
    set showcmd
    " hide mouse cursor when typing
    set mousehide
    " show the cursor position all the time
    set ruler
    " set 4 lines on the edge of the screen
    set scrolloff=4
    " Change the terminal title
    set title
    " disable the toolbar
    set guioptions-=T
    " disable the menu
    set guioptions-=m
    " don't update the display while executing macros
    set lazyredraw
    " highlight cursorline
     set cursorline
    " highlight long lines (soft limit: 80, hard limit: 100)
    au BufWinEnter *.php,*.js,*.html,*.py let w:m1=matchadd('Search', '\%<101v.\%>80v', -1)
    au BufWinEnter *.php,*.js,*.html,*.py let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
    " theme
    colorscheme nord
    " set background to transparent
    " called after the colorscheme is set to overwrite it
    hi Normal guibg=NONE ctermbg=NONE
" }

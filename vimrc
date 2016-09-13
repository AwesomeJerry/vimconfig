" ========== General Config ==========
syntax enable
" colorscheme holokai
colorscheme gruvbox

set autoindent											" Auto indent, enter Paste Mode `:set paste`
set background=dark									" Dark background
set number													" Line number
set enc=utf8												" Encoding
set t_Co=256												" Support 256 color
set expandtab												" Insert space characters whenever the tab key is pressed
set tabstop=2												" Tab size
set shiftwidth=2										" Shift width size
set backspace=2											" Fix backspace delete line
set autochdir 											" auto cd curent dir.
set laststatus=2										" always show status line
set relativenumber									" show line number in relative mode
set conceallevel=0									" Disable auto-hiding column in .json
set encoding=utf-8  								" The encoding displayed.
set fileencoding=utf-8  						" The encoding written to file.
set wildmenu                        " Show a menu of available command when pressing tab in command line
set wildmode=longest:list,full
filetype plugin on

" swap files (.swp) in a common location
" // means use the file's full path
set dir=~/.vim/_swap//

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/,~/tmp,.

" turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/_undo/

" ========== Key Map ==========  
map <leader>W <ESC>:w<ENTER>        " Write file
map <leader>Q <ESC>:q<ENTER>        " Quit file
map <leader>rc :tabnew ~/.vim/vimrc  " Open vimrc
map <leader>s :source ~/.vim/vimrc  " Source vimrc
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" ========== vim-json ==========
let g:vim_json_syntax_conceal = 0		" Disable auto-hide feature in json-vim

" ========== vim-jsx ==========   
let g:jsx_ext_required = 0					" ignore .jsx extension

" ========== vim-javascript ==========
let javascript_enable_domhtmlcss = 1 " Enables HTML/CSS syntax highlighting in your JavaScript file.

" ========== NERDTree ========== 
autocmd VimEnter * NERDTree 				" Enable NERDTree when Vim's open
map <F2> :NERDTreeToggle<CR>				" Using F2 to toggle NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " Close Vim if NERDTree is the last window
let NERDTreeShowHidden=1            " Show hidden files and folders

" ========== ctrlp ========== 
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*

" ========== vim-airline ========== 
let g:airline#extensions#tabline#enabled = 1 " Automatically displays all buffers when there's only one tab open.
let g:airline_section_c = '%F'			" Show all path of the file

" ========== syntastic ========== 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint_d'
" let g:syntastic_javascript_eslint_exe = 'npm run eslint'   " fix syntastic eslint look up for global modules

" ========== Colorizer ==========
let g:colorizer_auto_color = 1			" Automatic loading 

" ========== vim-indent-guides ==========
let g:indent_guides_enable_on_vim_startup = 1	" Enable indent guide when vim start

" ========== vim-closetag ==========
let g:closetag_filenames = "*.html,*.js,*.jsx"

" ========== matchtagalways ==========
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}

" ========== tern ==========
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" ========== vim-repeat ==========
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" ========== delimitmate ========== 
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1

" ========== undotree ==========
nnoremap <F5> :UndotreeToggle<cr>

" ========== vim-rooter ==========
" map <silent> <unique> <Leader>foo <Plug>RooterChangeToRootDirectory
" let g:rooter_manual_only = 1
" let g:rooter_disable_map = 1

" ========== nerdcommenter ========== 
let NERDSpaceDelims = 1

" ========== tagbar ==========
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = "~/ctags-5.8/ctags"

" ========== incsearch ==========
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch                        " This feature turns 'hlsearch' off automatically after searching-related motions.
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" ========== minimap ==========
nnoremap <F6> :MinimapToggle<cr>


" ========== Plugins ==========
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'				" A code-completion engine for Vim
Plug 'mxw/vim-jsx'									" React JSX syntax highlighting and indenting for vim
Plug 'pangloss/vim-javascript'			" Vastly improved Javascript indentation and syntax support in Vim.
Plug 'isRuslan/vim-es6'							" List of JavaScript ES6 snippets and syntax highlighting for vim.
" Plug 'othree/yajs.vim'              " YAJS.vim: Yet Another JavaScript Syntax for Vim
" Plug 'othree/es.next.syntax.vim'    " ES.Next syntax for Vim
Plug 'scrooloose/nerdtree'					" A tree explorer plugin for vim.
Plug 'bling/vim-airline'						" lean & mean status/tabline for vim that's light as air
Plug 'kien/ctrlp.vim'								"	Fuzzy file, buffer, mru, tag, etc finder.
Plug 'tpope/vim-fugitive'						" a Git wrapper so awesome, it should be illegal
Plug 'scrooloose/syntastic'					" Syntax checking hacks for vim	
Plug 'chrisbra/Colorizer'						" color hex codes and color names
Plug 'KabbAmine/vCoolor.vim'				"	Simple color selector/picker plugin for Vim.
Plug 'wavded/vim-stylus'						" Syntax Highlighting for Stylus
Plug 'nathanaelkane/vim-indent-guides'	" A Vim plugin for visually displaying indent levels in code
Plug 'digitaltoad/vim-jade'					" Vim Jade template engine syntax highlighting and indention
Plug 'mustache/vim-mustache-handlebars' " mustache and handlebars mode for vim
Plug 'elzr/vim-json'                " A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
Plug 'alvan/vim-closetag'           " Auto close (X)HTML tags
Plug 'valloric/matchtagalways'      " A Vim plugin that always highlights the enclosing html/xml tags
Plug 'marijnh/tern_for_vim'         " Tern plugin for Vim
Plug 'tpope/vim-surround'           " surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-repeat'             " repeat.vim: enable repeating supported plugin maps with '.'
Plug 'raimondi/delimitmate'         " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'mileszs/ack.vim'              " Vim plugin for the Perl module / CLI script 'ack'
Plug 'easymotion/vim-easymotion'    " Vim motions on speed!
Plug 'mbbill/undotree'              " The ultimate undo history visualizer for VIM
" Plug 'airblade/vim-rooter'          " Changes Vim working directory to project root (identified by presence of known directory or file).
Plug 'scrooloose/nerdcommenter'     " Vim plugin for intensely orgasmic commenting
Plug 'majutsushi/tagbar'            " Vim plugin that displays tags in a window, ordered by scope
Plug 'osyo-manga/vim-over'          " :substitute preview
Plug 'mhinz/vim-signify'            " Show a diff via Vim sign column.
Plug 'haya14busa/incsearch.vim'     " Improved incremental searching for Vim
Plug 'mtscout6/syntastic-local-eslint.vim'    " Prefer local repo install of eslint over global install with syntastic
" Plug 'leafgarland/typescript-vim'   " Typescript syntax files for Vim
Plug 'severin-lemaignan/vim-minimap'  " A Sublime-like minimap for VIM, based on the Drawille console-based drawing library
Plug 'plasticboy/vim-markdown'      " Markdown Vim Mode
Plug 'suan/vim-instant-markdown'    " Instant Markdown previews from Vim!

call plug#end()

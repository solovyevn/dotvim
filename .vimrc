" Disable compatibility with vi
" Not really needed in user's .vimrc, but required for system .vimrc
set nocompatible

" Enable enhanced colors
"set term=xterm-256color
set t_Co=256

" Disable filetype detection for instructions in this file till 'filetype on'
filetype off
" ========== PLUGINS PART START ==========
" Using Vundle
" Add Vundle to runtime path
set rtp+=~/.vim/bundle/Vundle.vim
" Initialize Vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" Set Vundle to manage itself
Plugin 'VundleVim/Vundle.vim'

" ---------- PLUGINS TO USE START ----------
" Run ':PluginInstall' after adding new plugins

" *** ColorSchemes START ***
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
" *** ColorSchemes END ***

" Enhanced status line
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
"Plugin 'vim-airline/vim-airline'
" Enhanced search on Ctrl-P (searches in multiple files)
Plugin 'kien/ctrlp.vim'
" Syntax checking
Plugin 'scrooloose/syntastic'
" Git integration (:Gcommand or :Git command)
Plugin 'tpope/vim-fugitive'
" File browser and manager
Plugin 'scrooloose/nerdtree'
" Git support for NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Tab support for NERDTree
Plugin 'jistr/vim-nerdtree-tabs'
" Python-mode, code check, completion, refactoring
Plugin 'klen/python-mode'
" SimplyFold, enhanced folding for Python
Plugin 'tmhedberg/SimpylFold'
" Display undo tree
Plugin 'sjl/gundo.vim'
" Code snippets support for various languages
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'matthewsimo/angular-vim-snippets'
" NERDCommenter
Plugin 'scrooloose/nerdcommenter'
" Autocompletion for various languages (Remember to do additional compilation)
Plugin 'Valloric/YouCompleteMe'
" Better indentation for Python
Plugin 'vim-scripts/indentpython.vim'
" TagBar aka Class explorer
Plugin 'majutsushi/tagbar'
" Tern JS code analysis for TagBar JS support
" (Remember to do npm install from plugin directory and to install jsctags:
" npm install -g git+https://github.com/ramitos/jsctags.git)
Plugin 'ternjs/tern_for_vim'
" Virtualenv/Pyvenv support for Python (Additional modifications need to be
" made to Powerline config to display enabled virtualenv)
Plugin 'jmcantrell/vim-virtualenv'
" Better JavaScript indentation
Plugin 'vim-scripts/JavaScript-Indent'
" Lates HAML support
Plugin 'tpope/vim-haml'
" HTML5 support (syntax, indent, completion)
Plugin 'othree/html5.vim'
" Better CSS syntax
Plugin 'juleswang/css.vim'
" Preview colors in code
Plugin 'ap/vim-css-color'
" Better SCSS syntax
Plugin 'cakebaker/scss-syntax.vim'
" LESS syntax support
Plugin 'groenewege/vim-less'
" Jinja2 syntax
Plugin 'Glench/Vim-Jinja2-Syntax'
" Better JavaScript syntax (required for jsx-vim)
Plugin 'pangloss/vim-javascript'
" Better JSON syntax highlighting
Plugin 'elzr/vim-json'
" Support for JSX syntax
Plugin 'mxw/vim-jsx'
" Syntax for JavaScript libraries
Plugin 'othree/javascript-libraries-syntax.vim'
" Enhanced search, Silver Searcher (ag) for vim
Plugin 'rking/ag.vim'
" Visual indent lines
Plugin 'nathanaelkane/vim-indent-guides'
" Type at multiple places at once
Plugin 'terryma/vim-multiple-cursors'
" Type less for HTML and CSS codding
Plugin 'mattn/emmet-vim'
" Go language support
Plugin 'fatih/vim-go'

" All plugins must be added above the following line
call vundle#end()
" ---------- PLUGINS TO USE END ----------
" ---------- PLUGINS' SETTINGS START ----------
" Molokai colorscheme
"let g:molokai_original=1
let g:rehash256=1

" Powerline
let g:Powerline_symbols='fancy'
"set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
"let g:airline_powerline_fonts=1

" Ctrl-P

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1
let g:syntastic_python_python_exec='python3'
let g:syntastic_python_checkers = ['pylint', 'python', 'pyflakes']
let g:syntastic_javascript_checkers=['eslint']
autocmd BufUnload,BufLeave * lclose " This should make sure loc list is closed with the main buffer

" Vim-fugitive

" NERDTree
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeIgnore=['\.pyc$', '\~$'] " Files to not display
let g:NERDTreeShowFiles=1
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeQuitOnOpen=1
"let NERDTreeMinimalUI=1
"au vimenter * nerdtree "auto-open on vim start
"au bufenter * if (winnr("$") == 1 && exists("g:nerdtree")
"\ && g:nerdtree.istabtree()) | q | endif

" NERDTree-Git plugin
set shell=/bin/bash
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" NERDTree-Tabs plugin
map <F3> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0 " Open on startup
let g:nerdtree_tabs_smart_startup_focus=2 " Always focus file tab on startup
let g:nerdtree_tabs_synchronize_view=0 " Synchronize scroll and cursor in all tabs
let g:nerdtree_tabs_synchronize_focus=0 " Synchronize focus in all tabs
let g:nerdtree_tabs_autofind=1 " Automatically find and select currently open file

" Python-mode
let g:pymode_run_bind='<C-F5>' " Run current file
let g:pymode_doc_bind='<C-d>' " Show docs
let g:pymode_rope_goto_definition_bind='<C-]>' " Go-To defenition
let g:pymode_rope_completion_bind='<C-Space>' " Autocomplete
let g:pymode=0 " Disable by default, enable in Python filetype file
let g:pymode_python='python3'
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pylint', 'mccabe']
let g:pymode_rope=0
let g:pymode_motion=0
let g:pymode_indent=0
let g:pymode_rope_completion=0 " Disable to use other completion
let g:pymode_syntax=1 " Disable to use other syntax highlighting
let g:pymode_syntax_print_as_function=1 " Highlight print as function
let g:pymode_virtualenv=1 " Autodetect virtualenv
let g:pymode_virtualenv_path=$VIRTUAL_ENV " Path to virtualenv
let g:pymode_options_max_line_length=119
let g:pymode_lint_options_pep8={'max_line_length': g:pymode_options_max_line_length}

" SimplyFold (additional settings are in python ftplugin)
let g:SimplyFold_docstring_preview=1 " Show docstrings for folded code

" Gundo
nnoremap U <ESC>:GundoToggle<CR>
"let g:gundo_width=60 " Graph sidebar width
"let g:gundo_preview_height=40 " Preview window height
let g:gundo_preview_bottom=1 " Show preview below main window instead of sidebar
let g:gundo_right=1 " Show the sidebar on the right/left
let g:gundo_help=1 " Disable showing help in the graph sidebar
let g:gundo_close_on_revert=1 " Auto close graph window after making a choice

" SnipMate

" NERDCommenter

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path='python3'
let g:ycm_server_python_interpreter='python3' " Force use of Python,
" that was used during compilation, for server side to prevent various errors
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_seed_identifiers_with_syntax=0 " Autocompletion for language special words, e.g. build-ins
let g:ycm_key_list_select_completion=['<TAB>', '<Down>'] " Keys to select the completion (forward)
let g:ycm_key_list_previous_completion=['<S-TAB>', '<Up>'] " Keys to select the completion (backward)
let g:ycm_goto_buffer_command='horizontal-split' " Where to show the result of Go-To
" (other useful settings are 'vertical-split' and 'new-tab')
let g:ycm_disable_for_files_larger_than_kb=10240
nmap <leader>g <ESC>:YcmCompleter GoToDefinitionElseDeclaration<CR>

" IndentPython

" TagBar
map <F8> <ESC>:TagbarToggle<CR>
let g:tagbar_left=0 " Show sidebar on the left/right
"let g:tagbar_vertical=40 " Show at horizontal split with instead of vertical
let g:tagbar_width=30 " Sidebar width
let g:tagbar_autoclose=0 " Close the bar after jumping to the tag
let g:tagbar_autofocus=1 " Focus the bar when it is opened
let g:tagbar_sort=1 " Sort tags by name instead of by order in the file
let g:tagbar_foldlevel=99 " Tags with higher level will be folded
let g:tagbar_autoshowtag=0 " Do not unfold to show child, just highligh parent
let g:tagbar_previewwin_pos='rightbelow'
let g:tagbar_autopreview=1 " Show preview for highlighted tag in preview window
"au VimEnter * nested :call tagbar#autoopen(1) " Autoopen when starting vim with supported filetype
"au FileType * nested :call tagbar#autoopen(0) " Autoopen when opening supported filetype
"au BufEnter * nested :call tagbar#autoopen(0) " Autoopen in new tab

" Tern for vim
let g:tern_show_signature_in_pum=1

" Vim-virtualenv
let g:virtualenv_directory='~/.virtualenvs'
let g:virtualenv_auto_activate=1

" JavaScript-Indent

" Vim-haml

" HTML5.vim
let g:html5_event_handler_attributes_complete=1
let g:html5_rdfa_attributes_complete=1
let g:html5_microdata_attributes_complete=1
let g:html5_aria_attributes_complete=1

" CSS.vim

" Vim-css-color

" SCSS-syntax

" Vim-less

" Vim-Jinja2-Syntax

" Vim-javascript
let g:javascript_enable_domhtmlcss=1 " Highlight HTML/CSS syntax in JS files
let g:javascript_fold=1 " Enable JS code folding
let g:javascript_ignore_javascriptdoc=0 " Enable JSDoc syntax highlighting
let g:javascript_plugin_jsdoc = 1 " Enbales JSDoc syntax highlighting
let g:javascript_plugin_flow = 1 " Enbales Flow syntax highlighting

" Vim-json
let g:vim_json_syntax_conseal=0 " Disable quotes concealing

" Vim-jsx
let g:jsx_ext_require=1 " Allow for JSX in JS files
let g:jsx_pragma_required=0 " Allow for JSX in post v0.12 files

" Javascript-libraries-syntax.vim
let g:used_javascript_libs=
\ 'underscore,jquery,backbone,angularjs,angularui,angularuirouter,react,flux,requirejs'

" Ag.vim
let g:ag_working_path_mode='r' " Search from project root instead of cwd
let g:ag_highlight=1 " Highlight the search term

" Vim-indent-guides
let g:indent_guides_auto_colors=1 " Auto calculate colors for active colorscheme
" Doesn't work good for terminal mode. If the above is disabled, the below
" 2 lines need to be defined with colors
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_color_change_percent=15 " Set color lighten/darken in percents
let g:indent_guides_guide_size=0 " Number of columns to use for the guide, no
" more then shiftwidth setting, set to 0 to use shiftwidth value
let g:indent_guides_start_level=1 " At what indent level to start highlighting
let g:indent_guides_space_guides=1 " Consider space as indentation
let g:indent_guides_enable_on_vim_startup=1 " Enable plugin on startup
let g:indent_guides_default_mapping=0 " Disable default key mapping <Leader>ig

" Vim-multiple-cursors
"let g:multi_cursor_start_key='<C-n>' " Key to enable multi-cursor mode
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Set keys which start special mappings in corresponding modes, otherwise
" mapping won't be expected in multi-cursor mode and won't work
let g:multi_cursor_insert_maps={'<C>':1}
let g:multi_cursor_normal_maps={'<Space>':1, '!':1, '@':1, '=':1, 'q':1, 'r':1, 
\'t':1, 'T':1, 'y':1, '[':1, ']':1, '\':1, 'd':1, 'f':1, 'F':1, 'g':1, '"':1,
\'z':1, 'c':1, 'm':1, '<':1, '>':1}
let g:multi_cursor_visual_maps={'i':1, 'a':1, 'f':1, 'F':1, 't':1, 'T':1}
" Set highlighting style for multy-cursors
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" Emmet-vim
let g:user_emmet_install_global=1 " Set to 0 to disable for all filetypes and
" enable for desired ones with au EmmetInstall in corresponding ftplugin file
let g:emmet_html5=1 " Enable HTML5 mode
let g:user_emmet_leader_key='<C-e>' " Key to invoke Emmet, default is <C-y>
let g:user_emmet_mode='a' " Modes in which to create Emmet mappings (n,v,i,a)
let g:user_emmet_settings={} " Redefine default Emmet settings

" Go-vim
let g:go_autodetect_gopath = 1
let g:go_test_show_name = 0 " Show test name before errors and log output
let g:go_test_timeout = '30s' " :GoTest timeout
let g:go_play_browser_command = 'chrome' " Browser to use for the docs and such
let g:go_auto_type_info = 1 " Show type info for the word under the cursor
let g:go_info_mode = 'guru' " Tool to use for :GoInfo, options: gopls, gocode, guru
let g:go_auto_sameids = 1 " Highlight uses of the word under the cursor
let g:go_updatetime = 200 " Update data from source files every this milliseconds
let g:go_jump_to_error = 0 " Jump to first error when running :GoRun, :GoBuild
let g:go_list_height = 0 " Quickfix and locations list window height
let g:go_fmt_autosave = 1 " Auto run :GoFmt on save
let g:go_fmt_options = {} " Options to pass to 'gofmt'
let g:go_fmt_fail_silently = 0 " Show location list for :GoFmt errors
let g:go_fmt_experimental = 1 " Updates undo history with :GoFmt modifications
let g:go_doc_keywordprg_enabled = 1 " Run 'godoc' instead of 'man'
let g:go_doc_max_height = 30 " Height of the :GoDoc window
let g:go_def_mode = 'guru' " Tool to use for :GoDef, options: gopls, godef, guru
let g:go_def_mappings_enabled = 1 " Use default key mappings for :GoDef
let g:go_def_reuse_buffer = 1
let g:go_bin_path = '/usr/local/go/bin' " Path to go-vim tools
let g:go_metalinter_autosave = 1 " Run :GoMetaLinter on save
let g:go_gocode_unimported_packages = 1 " Whether to show suggestions from unimported packages
let g:go_template_autocreate = 0 " Use template for new files
let g:go_template_file = 'new_file_template.go' " Template file to use
let g:go_template_test_file = 'new_test_file_template.go' " Template file to use for tests
let g:go_template_use_pkg = 1 " Whether to use package declaration instead of a template
let g:go_highlight_space_tab_error = 1 " Highlight spaces following tabs
let g:go_highlight_trailing_whitespace_error = 1 " Highlight trailing whitespace

" ---------- PLUGINS' SETTINGS END ----------
" ========== PLUGINS PART END ==========
" Enable color scheme based on VIM mode
if has ('gui_running')
	set background=dark
	colorscheme solarized
else
"	set background=dark
" 	holokai, antares, monokain, ir_black, molokai, blackboard, ingretu
 	colorscheme ingretu
endif

" Set the key to switch background in set color scheme
"call togglebg#map("<F4>")

" Enable flagging of unnecessary whitespace
" au BufRead,BufNewFile * match BadWhitespace /\s\+$/
" alternatively
"colorscheme desert
au InsertLeave * match ExtraWhitespace /\s\+$/
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Enable syntax highlighting filetype plugin support
filetype plugin indent on
" syntax on overrides color settings with defaults
" syntax enable uses current custom settings
syntax enable

" Key to make syntax check
"nnoremap <F6> <ESC><CR>

" Global indent settings
" File type specific settings go in ~/.vim/after/ftplugin/[filetype].vim
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set noexpandtab

" Mark 80th column
set colorcolumn=100
highlight ColorColumn ctermbg=233

" Highlight last text entered in insert mode
nnoremap gV `[v`]

" Enable basic folding
" For Python SimplyFold is used, which is set in corresponding ftplugin
set foldenable
set foldlevel=99 " Default no fold, set to 0 to fold
set foldlevelstart=10 " Levels to fold when opening a new window
set foldnestmax=10 " Sets maximum nesting of folds (vim max is 20)
set foldmethod=syntax " Fold based on indentation
nnoremap <Space>z za " Set Space key to fold/unfold

" Set to always display the statusline
set laststatus=2

" Set to always show line with tabs
set showtabline=2

" Show menu autocomplete entries
set wildmenu
set wildmode=longest,list " Show longer matches first in autocomplete suggestions

" Hide default mode line, using plugin instead
set noshowmode

" Prevent excessive redrawing
set lazyredraw

" Disable wrapping of lines on load and when typing
set nowrap
set fo-=t

" Wrap paragraph on key press
vmap <Leader>q gq
nmap <Leader>q gqap

" Separate backup and swap files from work files
" '//' will make vim use full path for saving, which prevents rewriting files
" with same name from different directories
" !Remember to create the directories manually, vim won't do it automatically!
set backup
set backupdir=~/.vim/backups//
set directory=~/.vim/swaps//

" Enable persistent undo history
" !Remember to create the directory manually, vim won't do it automatically!
set undofile
set undodir=~/.vim/undos//

" Increase undo and command history
set history=1000
set undolevels=1000

" Fix Del key and Bakcspace key
"set backspace=2
set backspace=indent,eol,start
:fixdel

" Set default encoding
set encoding=utf-8

" Set default <EOL>
set fileformat=unix

" Enable line numbering
set number

" Show matching brakets
set showmatch

" Highlight current line
set cursorline

" Enabling showing of specified count lines above and below the cursor
" (to see the context). Set to 999 to keep it vertically centered
set scrolloff=10

" Remap ESC for leaving Insert mode
inoremap jk <ESC>

" Remap leader key for shortcuts
let mapleader="\<Space>"

" Allow copy & paste to/from vim from/to xclipboard by default
set clipboard=unnamedplus
"set clipboard=unnamed

" Prevent breaking indentation when pasting from terminal in
" insert mode by pressing F2 before pasting
set pastetoggle=<F12>
set showmode

" Enable mouse cursor support in all modes
set mouse=a

" Enable natural language spellcheck
nn <F7> <ESC>:setlocal spell! spelllang=en_us<CR>

" Enable walking over wrapped line parts, define reverse for stepping over it
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Set Y to yank from cursot to the end of the line, instead of whole line
nnoremap Y y&

" Map Ctrl-Y to paste from "0 register (special register with last yank)
nnoremap <C-Y> "0p
vnoremap <C-Y> "0p

" Mapping to delete without yanking
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

" Mapping to replace selected text without yanking
vnoremap <Leader>p "_dP

" Split screen configuration
set splitbelow
set splitright
nnoremap <Leader>J <ESC>:split<CR> " Horizontal split open
nnoremap <Leader>L <ESC>:vsplit<CR> " Vertical split open
nnoremap <Leader>K <ESC>:close<CR> " Horizontal split open
nnoremap <Leader>H <ESC>:close<CR> " Vertical split open
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

" Tabs configuration
map <Leader>M <ESC>:tabnew<CR>
map <Leader>N <ESC>:tabclose<CR>
map <Leader>n <ESC>:tabprevious<CR>
map <Leader>m <ESC>:tabnext<CR>

" Using tabs like buffers
" set switchbuf=useopen,usetab,newtab

" Hide buffers instead of closing them
"set hidden

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Enhance indentation, prevents loosing selection
vnoremap < <gv
vnoremap > >gv

" Enable search result highlighting
set hlsearch

" Remove highlighting after search
nnoremap <F2> <ESC>:nohlsearch<CR>

" Make cursor move to the matched string while typing the search pattern
set incsearch

" Make search case insensitive
" Use with care, especially for substitution use cases
" Makes search case insensitive if search term is typed in lowercase, if at
" least one capital letter is in the search term it will be case sensitive
" set ignorecase

" Key mapping to save vim session state,
" to launch vim with saved state use 'vim -S' command in the shell
nnoremap <Leader>s <ESC>:mksession<CR>

" Auto-add new line at the end of file
set eol

" Set indentation to fit PEP8
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal autoindent
setlocal expandtab
setlocal shiftround
setlocal fileformat=unix
setlocal encoding=utf-8

" Set number of columns
setlocal textwidth=100

" Mark 80th column
setlocal colorcolumn=101
"highlight ColorColumn ctermbg=magenta

" Enable all syntax highlighting
let python_highlight_all=1

" Enable Python mode plugin
let g:pymode=0

" Settings for SimplyFold plugin
setlocal foldexpr=SimplyFold(v:lnum)
setlocal foldmethod=expr
let g:SimplyFold_docstring_preview=1 " Show docstrings for folded code

" Enable Virtualenv support for Autocompletion and Go To Definition
" Doesn't work with pyvenv
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
	"project_base_dir = os.environ['VIRTUAL_ENV']
	"activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	"execfile(activate_this, dict(__file__=activate_this))
"EOF

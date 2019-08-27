setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal autoindent
setlocal expandtab
setlocal shiftround
setlocal fileformat=unix
setlocal encoding=utf-8

" Set number of columns
setlocal textwidth=119

" Mark 80th column
setlocal colorcolumn=120
"highlight ColorColumn ctermbg=magenta

" Settings for SimplyFold plugin
setlocal foldexpr=SimplyFold(v:lnum)
setlocal foldmethod=expr
let g:SimplyFold_docstring_preview=1 " Show docstrings for folded code

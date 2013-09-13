""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python setl sw=4 sts=4

" TEMPLATES
function! LoadTemplate()
    " load a template based on the file extension
    silent! 0r ~/.vim_runtime/skel/tmpl.%:e

    " Replace some placeholders
    "%s/%FILENAME%/\=expand("%:t")/g
    "%s/%DATE%/\=strftime("%b %d, %Y")/g

    " This last one deletes the placeholder
    " %START% then leaves the cursor there.
    "%s/%START%//g
endfunction
autocmd! BufNewFile *.py call LoadTemplate()

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()


""""""""""""""""""""""""""""""
" => C section
"""""""""""""""""""""""""""""""
autocmd! BufNewFile *.c call LoadTemplate()


""""""""""""""""""""""""""""""
" => C++ section
"""""""""""""""""""""""""""""""
"autocmd! BufNewFile *.c call LoadTemplate()

""""""""""""""""""""""""""""""
" => Shell section
"""""""""""""""""""""""""""""""
autocmd! BufNewFile *.sh call LoadTemplate()

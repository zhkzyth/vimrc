"============================================================================
"File: tclsh.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer: Eric Thomas <eric.l.m.thomas at gmail dot com>
"License: This program is free software. It comes without any warranty,
" to the extent permitted by applicable law. You can redistribute
" it and/or modify it under the terms of the Do What The Fuck You
" Want To Public License, Version 2, as published by Sam Hocevar.
" See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

function! SyntaxCheckers_tcl_tclsh_IsAvailable()
    return executable('tclsh')
endfunction

function! SyntaxCheckers_tcl_tclsh_GetLocList()
    let makeprg = syntastic#makeprg#build({'exe': 'tclsh'})
    let errorformat = '%f:%l:%m'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'tcl',
    \ 'name': 'tclsh'})

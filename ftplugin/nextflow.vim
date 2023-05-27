" Vim filetype plugin file
" Language: Nextflow

if exists('b:did_ftplugin')
  finish
endif

runtime! ftplugin/groovy.vim

let s:cpo_save = &cpo
set cpo&vim

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal colorcolumn=80

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setl et< sw< sts< cc<'
else
  let b:undo_ftplugin = 'setl et< sw< sts< cc<'
endif

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2

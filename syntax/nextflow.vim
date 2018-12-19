if exists("b:current_syntax")
  finish
endif

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal colorcolumn=80

source $VIMRUNTIME/syntax/groovy.vim

syn region  nextflowBlockString          start=+'''+ keepend end=+'''+ contains=groovySpecialChar,groovySpecialError,@Spell,nextflowELExpr,@shell

syn match nextflowELExpr "\!{.\{-}}" contained


" Nextflow specifics

syn keyword nextflowDirective afterScript beforeScript cache container cpus clusterOptions disk echo errorStrategy executor ext label maxErrors maxForks maxRetries memory module penv publishDir queue scratch storeDir stageInMode stageOutMode tag time validExitStatus 

syn match nextflowBlock "\v(input|output|script|shell|exec):"

syn keyword nextflowKeyword from into

syn keyword nextflowType file val process Channel

syn keyword nextflowSpecial    workflow params launchDir

syn keyword nextflowConstant   null


" Apply highlighting
let b:current_syntax = "nextflow"

hi def link nextflowELExpr            Identifier
hi def link groovyELExpr              Identifier

hi def link nextflowConstant          Constant
hi def link nextflowDirective         Statement
hi def link nextflowKeyword           Operator
hi def link nextflowType              Type
hi def link nextflowSpecial           Special
hi def link nextflowBlock             Function

hi def link nextflowBlockString       String


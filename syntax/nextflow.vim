if exists("b:current_syntax")
  finish
endif

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal colorcolumn=80

" Groovy syntax
syn keyword groovyExternal        native package
syn match groovyExternal          "\<import\(\s\+static\>\)\?"
syn keyword groovyError           goto const
syn keyword groovyConditional     if else switch
syn keyword groovyRepeat          while for do
syn keyword groovyBoolean         true false
syn keyword groovyConstant        null
syn keyword groovyTypedef         this super
syn keyword groovyOperator        new instanceof
syn keyword groovyType            boolean char byte short int long float double
syn keyword groovyType            void
syn keyword groovyType          Integer Double Date Boolean Float String Array Vector List
syn keyword groovyStatement       return
syn keyword groovyStorageClass    static synchronized transient volatile final strictfp serializable
syn keyword groovyExceptions      throw try catch finally
syn keyword groovyAssert          assert
syn keyword groovyMethodDecl      synchronized throws
syn keyword groovyClassDecl       extends implements interface
" to differentiate the keyword class from MyClass.class we use a match here
syn match   groovyTypedef         "\.\s*\<class\>"ms=s+1
syn keyword groovyClassDecl         enum
syn match   groovyClassDecl       "^class\>"
syn match   groovyClassDecl       "[^.]\s*\<class\>"ms=s+1
syn keyword groovyBranch          break continue nextgroup=groovyUserLabelRef skipwhite
syn match   groovyUserLabelRef    "\k\+" contained
syn keyword groovyScopeDecl       public protected private abstract<Paste>

syn match groovyOperator "\.\."
syn match groovyOperator "<\{2,3}"
syn match groovyOperator ">\{2,3}"
syn match groovyOperator "->"
syn match groovyExternal        '^#!.*[/\\]groovy\>'
syn match groovyExceptions        "\<Exception\>\|\<[A-Z]\{1,}[a-zA-Z0-9]*Exception\>"

" Groovy JDK stuff
syn keyword groovyJDKBuiltin    as def in
syn keyword groovyJDKOperOverl  div minus plus abs round power multiply 
syn keyword groovyJDKMethods     each call inject sort print println 
syn keyword groovyJDKMethods    getAt putAt size push pop toList getText writeLine eachLine readLines
syn keyword groovyJDKMethods    withReader withStream withWriter withPrintWriter write read leftShift 
syn keyword groovyJDKMethods    withWriterAppend readBytes splitEachLine
syn keyword groovyJDKMethods    newInputStream newOutputStream newPrintWriter newReader newWriter 
syn keyword groovyJDKMethods    compareTo next previous isCase 
syn keyword groovyJDKMethods    times step toInteger upto any collect dump every find findAll grep
syn keyword groovyJDKMethods    inspect invokeMethods join 
syn keyword groovyJDKMethods    getErr getIn getOut waitForOrKill
syn keyword groovyJDKMethods    count tokenize asList flatten immutable intersect reverse reverseEach
syn keyword groovyJDKMethods    subMap append asWritable eachByte eachLine eachFile 
syn cluster groovyTop add=groovyJDKBuiltin,groovyJDKOperOverl,groovyJDKMethods

syn region  groovyCommentString    contained start=+"+ end=+"+ end=+$+ end=+\*/+me=s-1,he=s-1 contains=groovySpecial,groovyCommentStar,groovySpecialChar,@Spell
syn region  groovyComment2String   contained start=+"+  end=+$\|"+  contains=groovySpecial,groovySpecialChar,@Spell
syn match   groovyCommentCharacter contained "'\\[^']\{1,6\}'" contains=groovySpecialChar
syn match   groovyCommentCharacter contained "'\\''" contains=groovySpecialChar
syn match   groovyCommentCharacter contained "'[^\\]'"
syn cluster groovyCommentSpecial add=groovyCommentString,groovyCommentCharacter,groovyNumber
syn cluster groovyCommentSpecial2 add=groovyComment2String,groovyCommentCharacter,groovyNumber

syn region  groovyComment          start="/\*"  end="\*/" contains=@groovyCommentSpecial,groovyTodo,@Spell
syn match   groovyCommentStar      contained "^\s*\*[^/]"me=e-1
syn match   groovyCommentStar      contained "^\s*\*$"
syn match   groovyLineComment      "//.*" contains=@groovyCommentSpecial2,groovyTodo,@Spell
syn match   groovyLineComment      "#.*" contains=@groovyCommentSpecial2,groovyTodo,@Spell

" Strings and constants
syn match   groovySpecialError     contained "\\."
syn match   groovySpecialCharError contained "[^']"
syn match   groovySpecialChar      contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"


syn region  groovyString          start=+"+ end=+"+ end=+$+ contains=groovySpecialChar,groovySpecialError,@Spell,groovyELExpr
syn region  groovyString          start=+'+ end=+'+ end=+$+ contains=groovySpecialChar,groovySpecialError,@Spell

"syn include @shell syntax/sh.vim
"unlet b:current_syntax
syn region  nextflowBlockString          start=+'''+ keepend end=+'''+ contains=groovySpecialChar,groovySpecialError,@Spell,nextflowELExpr,@shell

syn match groovyELExpr "\${.\{-}}" contained
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

hi def link groovyCommentString       groovyString
hi def link groovyComment2String      groovyString
hi def link groovyCommentCharacter    groovyCharacter
hi def link groovyFuncDef             Function
hi def link groovyBraces              Function
hi def link groovyBranch              Conditional
hi def link groovyUserLabelRef        groovyUserLabel
hi def link groovyLabel               Label
hi def link groovyUserLabel           Label
hi def link groovyConditional         Conditional
hi def link groovyRepeat              Repeat
hi def link groovyExceptions          Exception
hi def link groovyAssert              Statement
hi def link groovyStorageClass        StorageClass
hi def link groovyMethodDecl          groovyStorageClass
hi def link groovyClassDecl           groovyStorageClass
hi def link groovyScopeDecl           groovyStorageClass
hi def link groovyBoolean             Boolean
hi def link groovySpecial             Special
hi def link groovySpecialError        Error
hi def link groovySpecialCharError    Error
hi def link nextflowBlockString       String
hi def link groovyString              String

hi def link groovyCharacter           Character
hi def link groovySpecialChar         SpecialChar
hi def link groovyNumber              Number
hi def link groovyError               Error
hi def link groovyStringError         Error
hi def link groovyStatement           Statement
hi def link groovyOperator            Operator
hi def link groovyComment             Comment
hi def link groovyDocComment          Comment
hi def link groovyLineComment         Comment
hi def link groovyConstant            Constant
hi def link groovyTypedef             Typedef
hi def link groovyTodo                Todo

hi def link groovyCommentTitle        SpecialComment
hi def link groovyDocTags             Special
hi def link groovyDocParam            Function
hi def link groovyCommentStar         groovyComment

hi def link groovyType                Type
hi def link groovyExternal            Include

hi def link htmlComment               Special
hi def link htmlCommentPart           Special
hi def link groovySpaceError          Error
hi def link groovyJDKBuiltin          Special
hi def link groovyJDKOperOverl        Operator
hi def link groovyJDKMethods          Function

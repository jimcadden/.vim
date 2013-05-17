" Highlight Class and Function names
" syn match    cCustomParen    "(" contains=cParen,cCppParen
" syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
" syn match    cCustomScope    "::"
" syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
"
" hi def link cCustomFunc  Function
" hi def link cCustomClass Function
"



syn keyword cppCustomStatement       nullptr

syn keyword cppCustomStlContainers   array vector deque forward_list list
syn keyword cppCustomStlContainers   set map multiset multimap
syn keyword cppCustomStlContainers   unordered_set unordered_map
syn keyword cppCustomStlContainers   unordered_multiset unordered_multimap
syn keyword cppCustomStlContainers   stack queue priority_queue
syn keyword cppCustomStlContainers   string

syn match   cppCustomParen         "?=(" contains=cParen,cCppParen
syn match   cppCustomFunc          "\w\+\s*(\@=" contains=cppCustomParen
syn match   cppCustomScope         "::"
syn match   cppCustomClass         "\w\+\s*::" contains=cppCustomScope

syn match   cppCustomStlNamespace  "std::" contains=cppCustomScope

hi def link cppCustomFunc       Function
hi def link cppCustomStatement  Statement

" Custom syntax definitions
hi def link cppCustomClass         ClassNamespace
hi def link cppCustomStlNamespace  StlNamespace
hi def link cppCustomStlContainers StlContaine

hi link ClassNamespace  SpecialKey
hi link StlNamespace    String 
hi link StlContaine     Directory


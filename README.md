jackmassey@raspberrypi:~/Desktop/revision-compilation $ gcc lex.yy.c -o lexeur -lfl
lexeur.l: In function ‘yylex’:
lexeur.l:52:1: warning: implicit declaration of function ‘by’ [-Wimplicit-function-declaration]
   52 | used by ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)       { increment_usage(yytext + 8); }
      | ^~
lexeur.l:52:5: error: expected expression before ‘[’ token
   52 | used by ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)       { increment_usage(yytext + 8); }
      |     ^
lexeur.l:52:6: error: ‘a’ undeclared (first use in this function)
   52 | used by ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)       { increment_usage(yytext + 8); }
      |      ^
lexeur.l:52:6: note: each undeclared identifier is reported only once for each function it appears in
lexeur.l:52:14: error: invalid suffix "_" on floating constant
   52 | used by ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)       { increment_usage(yytext + 8); }
      |              ^~~
lexeur.l:52:20: error: expected expression before ‘)’ token
   52 | used by ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)       { increment_usage(yytext + 8); }
      |                    ^
lexeur.l:52:21: error: stray ‘@’ in program
   52 | used by ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)       { increment_usage(yytext + 8); }
      |                     ^
lexeur.l:52:32: error: invalid suffix "_" on floating constant
   52 | used by ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)       { increment_usage(yytext + 8); }
      |                                ^~~
lexeur.l:52:38: error: expected expression before ‘)’ token
   52 | used by ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)       { increment_usage(yytext + 8); }
      |                                      ^
lexeur.l:53:1: warning: implicit declaration of function ‘from’ [-Wimplicit-function-declaration]
   53 | back from ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)    { increment_usage(yytext + 10); }
      | ^~~~
lexeur.l:53:7: error: expected expression before ‘[’ token
   53 | back from ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)    { increment_usage(yytext + 10); }
      |       ^
lexeur.l:53:16: error: invalid suffix "_" on floating constant
   53 | back from ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)    { increment_usage(yytext + 10); }
      |                ^~~
lexeur.l:53:22: error: expected expression before ‘)’ token
   53 | back from ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)    { increment_usage(yytext + 10); }
      |                      ^
lexeur.l:53:23: error: stray ‘@’ in program
   53 | back from ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)    { increment_usage(yytext + 10); }
      |                       ^
lexeur.l:53:34: error: invalid suffix "_" on floating constant
   53 | back from ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)    { increment_usage(yytext + 10); }
      |                                  ^~~
lexeur.l:53:40: error: expected expression before ‘)’ token
   53 | back from ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)    { increment_usage(yytext + 10); }
      |          

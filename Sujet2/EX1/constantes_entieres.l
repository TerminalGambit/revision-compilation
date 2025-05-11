%{
#include <stdio.h>
%}

%%

0[xX][0-9a-fA-F]+   { printf("HEXA\n"); }
0[0-7]+             { printf("OCTAL\n"); }
[1-9][0-9]*         { printf("DECIMAL\n"); }
0                  { printf("OCTAL\n"); }

.|\n                { /* ignorer les autres caractères */ }

%%
int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
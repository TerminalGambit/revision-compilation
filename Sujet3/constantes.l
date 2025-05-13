%{
#include <stdio.h>
%}

/* Définitions de motifs */
FLOAT_CONST      [+-]?([0-9]*\.[0-9]+|[0-9]+\.[0-9]*)([eE][+-]?[0-9]+)?
DEC_INT_CONST    [1-9][0-9]*([uU]?[lL]{0,2})?
OCT_INT_CONST    0[0-7]*([uU]?[lL]{0,2})?
HEX_INT_CONST    0[xX][0-9a-fA-F]+([uU]?[lL]{0,2})?
CHAR_CONST       '\''(\\[abfnrtv\\\'\"\?]|\\[0-7]{1,3}|\\x[0-9a-fA-F]+|[^\\'])'\''

%%

{FLOAT_CONST}      { printf("FLOAT_CONST : %s\n", yytext); }
{DEC_INT_CONST}    { printf("DECIMAL_INT_CONST : %s\n", yytext); }
{OCT_INT_CONST}    { printf("OCTAL_INT_CONST : %s\n", yytext); }
{HEX_INT_CONST}    { printf("HEXA_INT_CONST : %s\n", yytext); }
{CHAR_CONST}       { printf("CHAR_CONST : %s\n", yytext); }

[ \t\n]+           ; /* Ignorer les espaces blancs */

.                  { printf("UNKNOWN TOKEN : %s\n", yytext); }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
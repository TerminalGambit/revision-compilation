/* lexer_types_expression.l - Analyse lexicale pour tester la vérification de type */

%{
#include "types.h"
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

DIGIT   [0-9]+
FLOAT   [0-9]+\.[0-9]+
ID      [a-zA-Z_][a-zA-Z0-9_]*

%%

{FLOAT}         { yylval.floatval = atof(yytext); return CONSTANTE_FLOTTANTE; }
{DIGIT}         { yylval.intval = atoi(yytext); return CONSTANTE_ENTIERE; }
\+              { return ADDITION; }
\-              { return SOUSTRACTION; }
\*              { return MULTIPLICATION; }
%               { return MODULO; }
\(              { return '('; }
\)              { return ')'; }
{ID}            { yylval.strval = strdup(yytext); return variable; }
[ \t\n]+        { /* ignorer les espaces */ }
.               { printf("Caractère inconnu : %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
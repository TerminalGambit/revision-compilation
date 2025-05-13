%{
#include <stdio.h>
%}

%token IDENT CONST
%left '+' '-'
%left '*' '/'

%%

E : E E '+'      { printf("ADD\n"); }
  | E E '-'      { printf("SUB\n"); }
  | E E '*'      { printf("MUL\n"); }
  | E E '/'      { printf("DIV\n"); }
  | IDENT        { printf("PUSH %s\n", yytext); }
  | CONST        { printf("PUSH %s\n", yytext); }
;

%%

int main(int argc, char **argv) {
    yyparse();
    return 0;
}

int yywrap() {
    return 1;
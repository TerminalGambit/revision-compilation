/* analyse_types_expression.y - Vérification des types d'expressions arithmétiques */

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "types.h"

TypeExpr donneTypeDeclaration(char* nom) {
    // Simulation de récupération du type d'une variable
    if (strcmp(nom, "x") == 0) return entier;
    if (strcmp(nom, "y") == 0) return flottant;
    if (strcmp(nom, "p") == 0) return pointeur;
    return erreurtype;
}

void yyerror(const char* s) {
    fprintf(stderr, "Erreur: %s\n", s);
}
int yylex();
%}

%union {
    int intval;
    float floatval;
    char* strval;
    TypeExpr typeexpr;
}

%token <intval> CONSTANTE_ENTIERE
%token <floatval> CONSTANTE_FLOTTANTE
%token <strval> variable
%token ADDITION MULTIPLICATION SOUSTRACTION MODULO

%type <typeexpr> expression terme operateur

%%

expression:
    terme operateur expression {
        if ($2 == MODULO) {
            if ($1 == entier && $3 == entier) $$ = entier;
            else $$ = erreurtype;
        } else if ($1 == pointeur || $3 == pointeur) {
            if ($2 == ADDITION || $2 == SOUSTRACTION) {
                if (($1 == pointeur && $3 == entier) || ($1 == entier && $3 == pointeur))
                    $$ = pointeur;
                else
                    $$ = erreurtype;
            } else {
                $$ = erreurtype;
            }
        } else if ($1 == flottant || $3 == flottant) {
            if (($1 == entier || $1 == flottant) && ($3 == entier || $3 == flottant))
                $$ = flottant;
            else
                $$ = erreurtype;
        } else if ($1 == entier && $3 == entier) {
            $$ = entier;
        } else {
            $$ = erreurtype;
        }
    }
  | terme {
        $$ = $1;
    }
;

terme:
    '(' expression ')' {
        $$ = $2;
    }
  | CONSTANTE_ENTIERE {
        $$ = entier;
    }
  | CONSTANTE_FLOTTANTE {
        $$ = flottant;
    }
  | variable {
        $$ = donneTypeDeclaration($1);
    }
;

operateur:
    ADDITION { $$ = ADDITION; }
  | MULTIPLICATION { $$ = MULTIPLICATION; }
  | SOUSTRACTION { $$ = SOUSTRACTION; }
  | MODULO { $$ = MODULO; }
;

%%

int main() {
    printf("Saisir une expression :\n");
    yyparse();
    return 0;
}

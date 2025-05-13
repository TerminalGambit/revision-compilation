%{
#include <stdio.h>
#include <stdlib.h>
#include "log_analyzer.tab.h"
#include "data.h"

extern int yylex();
extern void yyrestart(FILE *input_file);
extern int yyparse();

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

void print_top_urls(int m);
%}

%start input

%%

input:
    /* vide */
    ;

%%

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Usage: %s <logfile>\n", argv[0]);
        return 1;
    }
    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror("fopen");
        return 1;
    }
    yyrestart(f);
    yyparse();
    fclose(f);
    
    int m;
    printf("Combien de pages les plus consultées souhaitez-vous afficher ? ");
    scanf("%d", &m);
    print_top_urls(m);
    return 0;
}

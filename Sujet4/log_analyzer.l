%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "log_analyzer.tab.h"
#include "data.h"

// Déclaration externe du yylval pour yacc
extern char *yytext;
void store_ip_and_url(const char *ip, const char *url);
char current_ip[64];
%}

%option noyywrap

%%
[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}    { strcpy(current_ip, yytext); }
\"(GET|POST|HEAD)[ ]+([^ ]+)[ ]+HTTP/[0-9.]+\"   { 
    char url[1024];
    sscanf(yytext, "\"%*s %s", url);
    store_ip_and_url(current_ip, url);
}
[ \t\n]    ; /* ignore whitespace */
.          ; /* ignore everything else */
%%

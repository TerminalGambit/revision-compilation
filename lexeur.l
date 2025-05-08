/* question_1_2.l - Trouver l'utilisateur qui fait un usage intensif de CPLEX */

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_USERS 1000

// Structures pour stocker les statistiques
typedef struct {
    char* login;
    int count;
} UserStats;

UserStats users[MAX_USERS];
int user_count = 0;

// Recherche un utilisateur existant ou l'ajoute
void increment_usage(const char* login) {
    for (int i = 0; i < user_count; ++i) {
        if (strcmp(users[i].login, login) == 0) {
            users[i].count++;
            return;
        }
    }
    if (user_count < MAX_USERS) {
        users[user_count].login = strdup(login);
        users[user_count].count = 1;
        user_count++;
    }
}

// Trouver l'utilisateur le plus actif
void print_most_active_user() {
    int max = 0;
    char* best = NULL;
    for (int i = 0; i < user_count; ++i) {
        if (users[i].count > max) {
            max = users[i].count;
            best = users[i].login;
        }
    }
    if (best) {
        printf("Utilisateur le plus actif : %s (%d utilisations)\n", best, max);
    }
}
%}

%%

used by ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)       { increment_usage(yytext + 8); }
back from ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)    { increment_usage(yytext + 10); }

.|
\n    ; // ignorer les autres lignes

%%

int main(int argc, char** argv) {
    yylex();
    print_most_active_user();
    return 0;
}

int yywrap() {
    return 1;
}

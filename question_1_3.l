/* question_1_3.l - Trouver les utilisateurs n'ayant pas restitué tous les jetons */

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_USERS 1000

typedef struct {
    char* login;
    int obtentions;
    int restitutions;
} UserStats;

UserStats users[MAX_USERS];
int user_count = 0;

void increment_obtention(const char* login) {
    for (int i = 0; i < user_count; ++i) {
        if (strcmp(users[i].login, login) == 0) {
            users[i].obtentions++;
            return;
        }
    }
    if (user_count < MAX_USERS) {
        users[user_count].login = strdup(login);
        users[user_count].obtentions = 1;
        users[user_count].restitutions = 0;
        user_count++;
    }
}

void increment_restitution(const char* login) {
    for (int i = 0; i < user_count; ++i) {
        if (strcmp(users[i].login, login) == 0) {
            users[i].restitutions++;
            return;
        }
    }
    if (user_count < MAX_USERS) {
        users[user_count].login = strdup(login);
        users[user_count].obtention = 0;
        users[user_count].restitutions = 1;
        user_count++;
    }
}

void print_unmatched_users() {
    printf("Utilisateurs n'ayant pas restitué tous leurs jetons :\n");
    for (int i = 0; i < user_count; ++i) {
        if (users[i].obtentions > users[i].restitutions) {
            printf("%s : obtentions = %d, restitutions = %d\n",
                   users[i].login,
                   users[i].obtentions,
                   users[i].restitutions);
        }
    }
}
%}

%%

used by ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)       { increment_obtention(yytext + 8); }
back from ([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)    { increment_restitution(yytext + 10); }

.|\\n    ; /* ignorer les autres lignes */

%%

int main(int argc, char** argv) {
    yylex();
    print_unmatched_users();
    return 0;
}

int yywrap() {
    return 1;
}
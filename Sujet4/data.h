#ifndef DATA_H
#define DATA_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ENTRIES 1000

typedef struct {
    char ip[64];
    char url[1024];
    int count;
} Entry;

extern Entry entries[MAX_ENTRIES];
extern int entry_count;

void store_ip_and_url(const char *ip, const char *url);
void print_top_urls(int m);

#endif 
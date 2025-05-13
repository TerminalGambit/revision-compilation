#include <stdio.h>
#include <string.h>
#include "data.h"

#define MAX_ENTRIES 1000

typedef struct {
    char ip[64];
    char url[1024];
    int count;
} Entry;

Entry entries[MAX_ENTRIES];
int entry_count = 0;

void store_ip_and_url(const char *ip, const char *url) {
    for (int i = 0; i < entry_count; i++) {
        if (strcmp(entries[i].url, url) == 0) {
            entries[i].count++;
            return;
        }
    }
    if (entry_count < MAX_ENTRIES) {
        strcpy(entries[entry_count].ip, ip);
        strcpy(entries[entry_count].url, url);
        entries[entry_count].count = 1;
        entry_count++;
    }
}

int compare(const void *a, const void *b) {
    return ((Entry *)b)->count - ((Entry *)a)->count;
}

void print_top_urls(int m) {
    qsort(entries, entry_count, sizeof(Entry), compare);
    for (int i = 0; i < m && i < entry_count; i++) {
        printf("%s (%d fois)\n", entries[i].url, entries[i].count);
    }
}
